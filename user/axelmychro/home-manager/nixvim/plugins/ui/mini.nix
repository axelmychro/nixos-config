_: {
  programs.nixvim.plugins = {
    mini = {
      enable = true;

      mockDevIcons = true;

      modules = {
        icons = {
          enable = true;
        };

        starter.header = ''
          ███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗
          ████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║
          ██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║
          ██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║
          ██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
        '';
      };
    };

    web-devicons = {
      enable = true;
    };
  };
}
