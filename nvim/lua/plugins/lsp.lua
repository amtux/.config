return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- LSP keymaps
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp_attach", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        map("gd", vim.lsp.buf.definition, "Go to definition")
        map("gr", vim.lsp.buf.references, "Go to references")
        map("gI", vim.lsp.buf.implementation, "Go to implementation")
        map("<leader>D", vim.lsp.buf.type_definition, "Type definition")
        map("<leader>ds", vim.lsp.buf.document_symbol, "Document symbols")
        map("<leader>ws", vim.lsp.buf.workspace_symbol, "Workspace symbols")
        map("<leader>rn", vim.lsp.buf.rename, "Rename")
        map("<leader>ca", vim.lsp.buf.code_action, "Code action")
        map("K", vim.lsp.buf.hover, "Hover documentation")
        map("gD", vim.lsp.buf.declaration, "Go to declaration")
      end,
    })

    -- LSP servers configuration
    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
              checkThirdParty = false,
              library = {
                "${3rd}/luv/library",
                unpack(vim.api.nvim_get_runtime_file("", true)),
              },
            },
            completion = {
              callSnippet = "Replace",
            },
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      },
      gopls = {},
      cue = {},
      bashls = {},
      yamlls = {
        filetypes = { "yaml", "yaml.docker-compose" },
        settings = {
          yaml = {
            schemas = {
              ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
              kubernetes = "*.yaml",
            },
          },
        },
      },
      helm_ls = {
        settings = {
          ["helm-ls"] = {
            yamlls = {
              path = "yaml-language-server",
            },
          },
        },
      },
    }

    -- Setup capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    -- Setup each server
    for server_name, server_opts in pairs(servers) do
      local opts = vim.tbl_deep_extend("force", {
        capabilities = vim.deepcopy(capabilities),
      }, server_opts or {})

      -- Use new vim.lsp.config API if available, fallback to lspconfig
      if vim.lsp.config and vim.lsp.config[server_name] then
        vim.lsp.enable(server_name)
      else
        require("lspconfig")[server_name].setup(opts)
      end
    end
  end,
}
