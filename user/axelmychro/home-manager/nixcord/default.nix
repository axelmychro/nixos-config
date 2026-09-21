{ inputs, ... }:
{
  imports = [ inputs.nixcord.homeModules.default ];
  programs.nixcord = {
    enable = true;
    config.frameless = true;
    discord.enable = false;
    equibop.enable = true;
  };
}
