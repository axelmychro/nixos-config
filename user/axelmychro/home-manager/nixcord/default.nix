{ inputs, ... }:
{
  imports = [ inputs.nixcord.homeModules.default ];
  programs.nixcord = {
    enable = true;
    discord.enable = false;
    equibop.enable = true;

    config = {
      frameless = true;
      plugins = {
        downloadAllAttachments.enable = true;
        viewRaw.enable = true;
      };
    };
  };
}
