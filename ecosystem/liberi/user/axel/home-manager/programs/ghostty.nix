_: {
  programs.ghostty = {
    enable = true;
    enableBashIntegration = false;

    themes = {
      catppuccin-frappe = {
        background = "303446";
        foreground = "c6d0f5";
        cursor-color = "f2d5cf";
        cursor-text = "232634";
        palette = [
          "0=#51576d"
          "1=#e78284"
          "2=#a6d189"
          "3=#e5c890"
          "4=#8caaee"
          "5=#f4b8e4"
          "6=#81c8be"
          "7=#a5adce"
          "8=#626880"
          "9=#e78284"
          "10=#a6d189"
          "11=#e5c890"
          "12=#8caaee"
          "13=#f4b8e4"
          "14=#81c8be"
          "15=#b5bfe2"
        ];
        selection-background = "44495d";
        selection-foreground = "c6d0f5";
        split-divider-color = "414559";
      };
      nord = {
        background = "2e3440";
        foreground = "d8dee9";

        cursor-color = "88c0d0";
        cursor-text = "2e3440";

        palette = [
          "0=#3b4252"
          "1=#bf616a"
          "2=#a3be8c"
          "3=#ebcb8b"
          "4=#81a1c1"
          "5=#b48ead"
          "6=#88c0d0"
          "7=#e5e9f0"
          "8=#4c566a"
          "9=#bf616a"
          "10=#a3be8c"
          "11=#ebcb8b"
          "12=#81a1c1"
          "13=#b48ead"
          "14=#8fbcbb"
          "15=#eceff4"
        ];

        selection-background = "434c5e";
        selection-foreground = "eceff4";
        split-divider-color = "4c566a";
      };
    };
    settings = {
      shell-integration = "none";
      theme = "nord";

      font-family = "FiraCode Nerd Font";
      font-size = 16;
      cursor-style = "underline";
      shell-integration-features = "no-cursor";
      mouse-hide-while-typing = true;
      mouse-scroll-multiplier = 3;

      title = "PRTS";
      window-decoration = "none";
      window-height = 24;
      window-width = 80;
      window-save-state = "never";
    };
  };
}
