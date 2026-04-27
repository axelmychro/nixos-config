_: {
  boot.loader.grub.extraEntries = ''
    ${builtins.readFile ./gentoo}
    ${builtins.readFile ./gentoo-zen}
    ${builtins.readFile ./artix}
  '';
}
