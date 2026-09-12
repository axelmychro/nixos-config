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
    theme = "silvia";
    backgrounds.${sddm_bg_file_name} = "${assets}/${sddm_bg_file_name}";
    settings = {
      "LockScreen".background = sddm_bg_file_name;
      "LockScreen.Date".color = white;
      "LockScreen.Clock".color = white;

      "LoginScreen".background = sddm_bg_file_name;
      "LoginScreen.Clock".font-family = font_family_name;
      "LoginScreen.Date".font-family = font_family_name;
      "LoginScreen.Message" = {
        font-family = font_family_name;
        color = white;
      };
      "LoginScreen.LoginArea.Avatar".shape = "square";
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
    enable = true;
  };
}
