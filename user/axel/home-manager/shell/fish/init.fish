set fish_greeting
if status is-interactive
    clear -x
end
if test $SHLVL -le 2
    fastfetch
end
