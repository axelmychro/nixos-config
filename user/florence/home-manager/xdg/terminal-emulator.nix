{
  config,
  lib,
  pkgs,
  ...
}:
let
  terminal_emulators = {
    alacritty = {
      command = "alacritty";
      entry = "Alacritty.desktop";
      package = pkgs.alacritty;
    };
    ghostty = {
      command = "ghostty";
      entry = "com.mitchellh.ghostty.desktop";
      package = pkgs.ghostty;
    };
    kitty = {
      command = "kitty";
      entry = "kitty.desktop";
      package = pkgs.kitty;
    };
  };
  default_terminal_emulator =
    terminal_emulators.${config.defaultApplications.terminalEmulator.program};
in
{
  options.defaultApplications.terminalEmulator = lib.mkOption {
    type = lib.types.submodule {
      options = {
        program = lib.mkOption {
          type = lib.types.enum [
            "kitty"
            "alacritty"
            "ghostty"
          ];
          description = "Default terminal emulator.";
        };
        command = lib.mkOption { type = lib.types.str; };
        entry = lib.mkOption { type = lib.types.str; };
      };
    };
  };
  config = {
    defaultApplications.terminalEmulator.command = default_terminal_emulator.command;
    defaultApplications.terminalEmulator.entry = default_terminal_emulator.entry;
    home.packages = [ default_terminal_emulator.package ];
    programs.kitty.enable = config.defaultApplications.terminalEmulator.program == "kitty";
  };
}
