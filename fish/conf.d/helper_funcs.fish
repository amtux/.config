function jumpto --description 'Jump to ssh host'
    set host "$argv[1]"
    test -z "$host" && echo "Usage: jumpto <host> [user]" && return
    set user "$argv[2]"
    test -z "$user" && set user root
    echo "Jumpting to $user@$host"
    ssh -i ~/.ssh/amtux $user@$host
end
