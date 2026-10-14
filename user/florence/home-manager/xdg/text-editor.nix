{
  config,
  lib,
  pkgs,
  ...
}:
let
  text_editors = {
    neovim = {
      command = "nvim";
      entry = "nvim.desktop";
      package = pkgs.neovim;
    };
    vscode = {
      command = "code";
      entry = "code.desktop";
      package = pkgs.vscode;
    };
    zed = {
      command = "zeditor";
      entry = "dev.zed.Zed.desktop";
      package = pkgs.zed-editor;
    };
  };
  default_text_editor = text_editors.${config.defaultApplications.textEditor.program};
in
{
  options.defaultApplications.textEditor = lib.mkOption {
    type = lib.types.submodule {
      options = {
        program = lib.mkOption {
          type = lib.types.enum [
            "zed"
            "neovim"
            "vscode"
          ];
          description = "Default text editor.";
        };
        command = lib.mkOption { type = lib.types.str; };
        entry = lib.mkOption { type = lib.types.str; };
      };
    };
  };
  config = {
    defaultApplications.textEditor.command = default_text_editor.command;
    defaultApplications.textEditor.entry = default_text_editor.entry;
    home.packages = [ default_text_editor.package ];
    programs.zed-editor.enable = config.defaultApplications.textEditor.program == "zed";
  };
}
