{
  assets,
  inputs,
  ...
}:
let
  sddm_bg_file_name = "amiya.mp4";
  font_family_name = "GoMono Nerd Font";
  white = ''
    "#FFFFFF"
  '';
in
{
  imports = [
    inputs.silentSDDM.nixosModules.default
  ];
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  programs.silentSDDM = {
    enable = true;
    theme = "amiya";
    backgrounds.${sddm_bg_file_name} = "${assets}/${sddm_bg_file_name}";
    settings = {
      "LockScreen".background = sddm_bg_file_name;
      "LockScreen.Clock".color = white;
      "LockScreen.Date".color = white;
      "LockScreen.Message".color = white;

      "LoginScreen".background = sddm_bg_file_name;
      "LoginScreen.LoginArea.Avatar" = {
        shape = "square";
        border-radius = 5;
      };
      "LoginScreen.LoginArea.Username" = {
        font-family = font_family_name;
        color = white;
      };
      "LoginScreen.LoginArea.PasswordInput".font-family = font_family_name;
      "LoginScreen.LoginArea.LoginButton".font-family = font_family_name;
      "LoginScreen.LoginArea.Spinner" = {
        font-family = font_family_name;
        color = white;
      };
      "LoginScreen.LoginArea.WarningMessage" = {
        font-family = font_family_name;
        font-weight = 700;
        normal-color = white;
        warning-color = white;
        error-color = white;
      };
      "LoginScreen.LoginArea.Buttons".font-family = font_family_name;
      "LoginScreen.LoginArea.Popups".font-family = font_family_name;
      "Tooltips".font-family = font_family_name;
    };
  };
}
