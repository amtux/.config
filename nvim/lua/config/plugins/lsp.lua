-- LSP is a language server running in the background that understands the whole project.
-- Provides: go-to-definition, find references, rename across files, code actions,
-- diagnostics (errors/warnings), completion. It understands semantics ("this function
-- takes 2 args and returns an error", "this variable is unused").

-- Keymaps and native completion, activated when an LSP server attaches to a buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp_attach", { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc, opts)
      opts = opts or {}
      opts.buffer = event.buf
      opts.desc = "LSP: " .. desc
      vim.keymap.set("n", keys, func, opts)
    end

    map("gd", vim.lsp.buf.definition, "Go to definition")
    -- for auto-jump when there's only one result, replace with a custom on_list handler:
    -- map("gr", function()
    --   vim.lsp.buf.references({ includeDeclaration = false }, {
    --     on_list = function(options)
    --       if #options.items == 1 then
    --         local item = options.items[1]
    --         vim.cmd("edit " .. vim.fn.fnameescape(item.filename))
    --         vim.api.nvim_win_set_cursor(0, { item.lnum, item.col - 1 })
    --       else
    --         vim.fn.setqflist({}, " ", options)
    --         vim.cmd("botright copen")
    --       end
    --     end,
    --   })
    -- end, "Go to references", { nowait = true })
    map("gr", vim.lsp.buf.references, "Go to references")
    map("gI", vim.lsp.buf.implementation, "Go to implementation")
    map("gD", vim.lsp.buf.declaration, "Go to declaration")
    map("K", vim.lsp.buf.hover, "Hover documentation")
    map("<leader>D", vim.lsp.buf.type_definition, "Type definition")
    map("<leader>ds", vim.lsp.buf.document_symbol, "Document symbols")
    map("<leader>ws", vim.lsp.buf.workspace_symbol, "Workspace symbols")
    map("<leader>cr", vim.lsp.buf.rename, "Rename")
    map("<leader>ca", vim.lsp.buf.code_action, "Code action")

    -- enable native completion (C-n/C-p to navigate, C-y to accept)
    vim.lsp.completion.enable(true, event.data.client_id, event.buf, { autotrigger = true })
  end,
})

-- LSP server configurations
vim.lsp.config("lua_ls", {
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
})

vim.lsp.config("gopls", {
  settings = {
    gopls = {
      usePlaceholders = true,
    },
  },
})

vim.lsp.config("cue", {
  cmd = { "cue", "lsp", "serve" },
  filetypes = { "cue" },
  root_markers = { "cue.mod", ".git" },
})

vim.lsp.config("bashls", {})

vim.lsp.config("yamlls", {
  filetypes = { "yaml", "yaml.docker-compose" },
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        kubernetes = "*.yaml",
      },
    },
  },
})

vim.lsp.config("helm_ls", {
  settings = {
    ["helm-ls"] = {
      yamlls = {
        path = "yaml-language-server",
      },
    },
  },
})

vim.lsp.enable({ "lua_ls", "gopls", "cue", "bashls", "yamlls", "helm_ls" })
