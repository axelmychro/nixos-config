{
  programs.nixcord = {
    config.frameless = true;
    discord = {
      equicord.enable = true;
      enable = false;
    };
    equibop.enable = true;
    enable = true;
  };
}
