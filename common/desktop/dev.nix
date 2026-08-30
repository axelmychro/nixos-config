{
  lib,
  pkgs,
  config,
  ...
}:
{
  config = lib.mkIf config.common.dev.enable {
    services = {
      ollama = {
        enable = config.common.dev.ai.enable;
        package = pkgs.ollama-cuda;
        port = 11434;
      };
      open-webui = {
        enable = config.common.dev.ai.enable;
        port = 8081;
      };
    };
    programs.tmux.enable = true;
    environment.systemPackages = [
      pkgs.zed-editor
    ]
    ++ lib.optional config.common.dev.ai.enable pkgs.aichat;
  };
  options.common.dev = {
    enable = lib.mkEnableOption "Common desktop dev options";
    ai.enable = lib.mkEnableOption "AI in dev.";
  };
}
