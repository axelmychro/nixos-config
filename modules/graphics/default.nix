{
  pkgs,
  ...
}:
{
  hardware = {
    enableRedistributableFirmware = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
  services.xserver.enable = false;

  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1"; # for chromium,electron
    };
    systemPackages = with pkgs; [
      pciutils
    ];
  };
}
