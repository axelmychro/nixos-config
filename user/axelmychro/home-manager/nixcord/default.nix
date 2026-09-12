{ inputs, theme, ... }:
{
  imports = [ inputs.nixcord.homeModules.default ];
  programs.nixcord = {
    quickCss =
      if theme == "rose-pine" then
        builtins.readFile ./rose-pine.css
      else
        builtins.readFile ./rose-pine-dawn.css;
    config = {
      frameless = true;
      useQuickCss = true;
    };
    discord.enable = false;
    enable = true;
    equibop.enable = true;
  };
}
