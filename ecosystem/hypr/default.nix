{ inputs, pkgs, ... }: {
  programs.hyprland = {
    enable = true;
    withUWSM = false;
    xwayland.enable = true; # WARN: Required for Steam.
  };

  services.gnome.gnome-keyring.enable = true;

  environment.systemPackages = with pkgs; [
    # NOTE: Hyprland polkit could be enabled with home-manager
    # services.hyprpolkitagent.enable = hyprland_enabled;.

    #hyprpolkitagent

    # NOTE: On NixOS, xdg-desktop-portal-hyprland
    # is already enabled by the NixOS module for Hyprland,
    # through programs.hyprland.enable = true;.

    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default

    # NOTE: The following programs could be replaced by
    # Noctalia features, therefore redundant.

    #hyprpaper hyprlauncher hypridle hyprlock hyprsunset

    nautilus
    hyprpicker
    hyprsysteminfo
    hyprland-qt-support
    hyprpwcenter
    hyprshutdown
    hyprtoolkit
    hyprcursor
    hyprmon
  ];
}
