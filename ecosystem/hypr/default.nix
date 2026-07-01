{ pkgs, ... }:
{
  programs.hyprland.enable = true;

  environment = {
    systemPackages = with pkgs; [
      kitty
    ];

    sessionVariables.NIXOS_OZONE_WL = "1";
  };

}
