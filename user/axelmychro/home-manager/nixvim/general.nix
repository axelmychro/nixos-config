{ config, ... }:
{
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = "\\";

      autoformat = true;
      snacks_animate = true;
      lazyvim_picker = "auto";
      lazyvim_cmp = "auto";

      deprecation_warnings = false;
      trouble_lualine = true;
    };

    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "macchiato";
    };
    colorscheme = "catppuccin";

    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };
  };
}
