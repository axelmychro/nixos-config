{ pkgs, config, ... }:
{
  programs.nixvim = {
    enable = true;

    globals.mapleader = " ";
    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>lua vim.diagnostic.open_float()<CR>";
      }
      {
        mode = "n";
        key = "]d";
        action = "<cmd>lua vim.diagnostic.goto_next()<CR>";
      }
      {
        mode = "n";
        key = "[d";
        action = "<cmd>lua vim.diagnostic.goto_prev()<CR>";
      }
      {
        mode = "n";
        key = "<leader>q";
        action = "<cmd>lua vim.diagnostic.setloclist()<CR>";
      }
    ];

    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "macchiato";
    };
    colorscheme = "catppuccin";

    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    extraPackages = with pkgs; [
      tree-sitter
    ];

    plugins = {
      lsp = {
        enable = true;
        inlayHints = true;
      };
      conform-nvim = {
        enable = true;
        settings.format_on_save = {
          timeout_ms = 500;
          lsp_fallback = true;
        };
      };
      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
          indent.enable = true;
        };
        folding.enable = false;
      };
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
          ];
          snippet = {
            expand = "function(args) require('luasnip').lsp_expand(args.body) end";
          };
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-e>" = "cmp.mapping.close()";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          };
        };
      };
      cmp-nvim-lsp.enable = true;
      cmp-buffer.enable = true;
      cmp-path.enable = true;
    };
  };

  _module.args.grammars = config.programs.nixvim.plugins.treesitter.package.builtGrammars;
  imports = [ ./lang/index.nix ];
}
