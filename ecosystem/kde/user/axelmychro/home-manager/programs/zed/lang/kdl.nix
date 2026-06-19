{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kdlfmt
  ];

  programs.zed-editor = {
    extensions = [ "kdl" ];

    userSettings.languages."Kdl" = {
      formatter.external = {
        command = "kdlfmt";
        arguments = [
          "format"
          "-"
        ];
      };
    };
  };
}
