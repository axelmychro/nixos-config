{
  lib,
  pkgs,
  config,
  ...
}:
{
  config = lib.mkIf config.common.development.enable {
    services = {
      ollama = {
        enable = config.common.development.ai.enable;
        package = pkgs.ollama-cuda;
        port = 11434;
      };
      open-webui = {
        enable = config.common.development.ai.enable;
        port = 8081;
      };
    };
    programs.tmux.enable = true;
    environment.systemPackages = [
      pkgs.zed-editor
      pkgs.video2x
    ]
    ++ lib.optional config.common.development.ai.enable [
      pkgs.aichat
      pkgs.upscayl
      pkgs.video2x
    ];
  };
  options.common.development = {
    enable = lib.mkEnableOption "Common desktop development options";
    ai.enable = lib.mkEnableOption "AI in development.";
  };
}
