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

    set key --
    test "$code" -gt 0; and set key '!!'

    printf ' %s %s\n' "$key" "$msg"
    set_color normal

    return "$code"
end
