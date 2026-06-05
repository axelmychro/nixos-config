function mount-git
    set git_partition /dev/nvme0n1p6
    set git_home "$HOME/git"
    mkdir -p -- "$git_home"
    sudo mount -- "$git_partition" "$git_home"
    sudo chown -R "$USER": "$git_home"
end
