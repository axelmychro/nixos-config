{
  config,
  lib,
  pkgs,
  ...
}:
let
  web_browsers = {
    brave = {
      command = "brave";
      entry = "com.brave.Browser.desktop";
      package = pkgs.brave;
    };
    firefox = {
      command = "firefox";
      entry = "firefox.desktop";
      package = pkgs.firefox;
    };
    google-chrome = {
      command = "google-chrome-stable";
      entry = "google-chrome.desktop";
      package = pkgs.google-chrome;
    };
  };
  default_web_browser = web_browsers.${config.defaultApplications.webBrowser.program};
in
{
  options.defaultApplications.webBrowser = lib.mkOption {
    type = lib.types.submodule {
      options = {
        program = lib.mkOption {
          type = lib.types.enum [
            "brave"
            "google-chrome"
            "firefox"
          ];
          description = "Default web browser.";
        };
        command = lib.mkOption { type = lib.types.str; };
        entry = lib.mkOption { type = lib.types.str; };
      };
    };
  };
  config = {
    defaultApplications.webBrowser.command = default_web_browser.command;
    defaultApplications.webBrowser.entry = default_web_browser.entry;
    home.packages = [ default_web_browser.package ];
  };
}
