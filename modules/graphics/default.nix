{
  pkgs,
  ...
}:
{
  services.xserver.enable = false;
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    enableRedistributableFirmware = true;
  };
  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1"; # for chromium,electron
    };
    systemPackages = with pkgs; [
      pciutils
    ];
  };
}
