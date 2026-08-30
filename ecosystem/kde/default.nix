{
  assets,
  inputs,
  pkgs,
  ...
}:
let
  sddm_bg_file_name = "priestess_moon.mp4";
in
{
  imports = [
    inputs.silentSDDM.nixosModules.default
  ];
  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
  };
  programs.silentSDDM = {
    theme = "rei";
    backgrounds."${sddm_bg_file_name}" = "${assets}/${sddm_bg_file_name}";
    settings = {
      "LockScreen" = {
        background = "${sddm_bg_file_name}";
      };
      "LockScreen.Message" = {
        text = "Welcome back, Oracle.";
      };
      "LoginScreen" = {
        background = "${sddm_bg_file_name}";
      };
    };
    enable = true;
  };
  environment = {
    plasma6.excludePackages = [
      pkgs.kdePackages.plasma-browser-integration
    ];
    systemPackages = [
      pkgs.haruna
    ];
  };
}
