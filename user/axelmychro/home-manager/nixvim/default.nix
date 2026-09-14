{ inputs, theme, ... }:
let
  colorschemes = {
    rose-pine = {
      enable = true;
      settings.variant = if theme == "rose-pine" then "main" else "dawn";
    };
  };
  colorscheme = if theme == "rose-pine" || theme == "rose-pine-dawn" then "rose-pine" else "";
in
{
  programs.nixvim = {
    enable = true;
    inherit colorschemes colorscheme;

    globals = {
      mapleader = " ";
      #maplocalleader = "\\";

      #autoformat = true;
      #snacks_animate = true;
      #lazyvim_picker = "auto";
      #lazyvim_cmp = "auto";

      #deprecation_warnings = false;
      #trouble_lualine = true;
    };
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };
  };

  imports = [
    inputs.nixvim.homeModules.default
    ./keymaps/index.nix
    ./plugins/index.nix
    ./lang/index.nix
  ];
}
