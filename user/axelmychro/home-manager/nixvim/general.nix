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

    colorschemes.rose-pine = {
      enable = true;
      settings.variant = "dawn";
    };
    colorscheme = "rose-pine-dawn";

    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };
  };
}
