{
  assets,
  config,
  inputs,
  pkgs,
  theme,
  user,
  version,
  wallpaper-file,
  ...
}:
{
  programs = {
    fish.enable = true;
    gnupg.agent.enable = true;
  };
  users.users.${user} = {
    shell = pkgs.fish;
    extraGroups = [
      "video"
      "render"
      "docker"
      "libvirtd"
    ];
    packages = with pkgs; [
      eza
      fd
      ripgrep
      trash-cli
    ];
  };
  home-manager = {
    extraSpecialArgs = {
      inherit
        assets
        inputs
        theme
        wallpaper-file
        ;
      default_applications = {
        web_browser = {
          command = "brave";
          entry = "com.brave.Browser.desktop";
        };
        file_manager = {
          command = "nemo";
          entry = "nemo.desktop";
        };
        mail_client = {
          command = "thunderbird";
          entry = "thunderbird.desktop";
        };
        audio_player = {
          command = "amberol";
          entry = "io.bassi.Amberol.desktop";
        };
        video_player = {
          command = "haruna";
          entry = "com.brave.Browser.desktop";
        };
        image_viewer = {
          command = "loupe";
          entry = "org.gnome.Loupe.desktop";
        };
        calendar = {
          command = "thunderbird";
          entry = "thunderbird.desktop";
        };
        terminal_emulator = {
          command = "kitty";
          entry = "kitty.desktop";
        };
        text_editor = {
          command = "zeditor";
          entry = "dev.zed.Zed.desktop";
        };
      };
      system_hyprland = {
        is_enabled = config.programs.hyprland.enable;
        uwsm.is_enabled = config.programs.hyprland.withUWSM;
      };
    };
    sharedModules = [ inputs.plasma-manager.homeModules.plasma-manager ];

    users.${user} = {
      home = {
        homeDirectory = "/home/${user}";
        stateVersion = version; # WARNING: HM is developed against nixos-unstable

        # NOTE: This is hardcoded because I like dawn pointer cursor.
        pointerCursor = {
          enable = true;
          package = pkgs.rose-pine-cursor;
          name = "BreezeX-RosePineDawn-Linux";
          size = 64;
        };
      };

      imports = [
        # Foundational
        ./xdg
        ./stylix
        ./cosmic-manager
        ./plasma-manager
        ./nixvim
        ./noctalia

        # Supplementary
        ./bash
        ./cava
        ./direnv
        ./editorconfig
        ./fastfetch
        ./fish
        ./git
        ./glow
        ./hyfetch
        ./hypr
        ./kitty
        ./konsole
        ./lazygit
        ./nixcord
        ./oh-my-posh
        ./tmux
        ./yazi
        ./zed
      ];
    };
  };
}
