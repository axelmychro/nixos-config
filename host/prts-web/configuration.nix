_: {
  imports = [
    ./hardware-configuration.nix
  ];
  boot.loader.grub = {
    enable = true;
    device = "/dev/vda";
  };
  networking.networkmanager.enable = true;
}
