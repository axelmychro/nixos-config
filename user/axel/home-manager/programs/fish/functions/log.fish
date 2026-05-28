function log
    argparse e/error -- $argv
    or return
    set msg (string join " " $argv)

    set code 0
    set_color blue
    if set -q _flag_error
        set code 1
        set_color red
    end
    printf "(%s) %s\n" "$code" "$msg"
    set_color normal

    return "$code"
end
