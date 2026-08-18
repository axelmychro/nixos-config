_: {
  programs.cava.enable = true;
  xdg.configFile."cava/config".text = ''
    [color]
    background = '#faf4ed'
    gradient = 1
    gradient_count = 6
    gradient_color_1 = '#286983'
    gradient_color_2 = '#56949f'
    gradient_color_3 = '#907aa9'
    gradient_color_4 = '#b4637a'
    gradient_color_5 = '#d7827e'
    gradient_color_6 = '#ea9d34'

  '';
}
