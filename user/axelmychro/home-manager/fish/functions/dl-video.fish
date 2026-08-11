function dl-video
    set -- url "$argv[1]"
    test -z "$url"; and log -e 'No URL provided'; and return

    nix-shell -p yt-dlp --run "yt-dlp -f 'bestvideo' '$url'"
end
