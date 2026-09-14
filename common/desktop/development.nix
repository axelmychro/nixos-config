{
  lib,
  pkgs,
  config,
  ...
}:
let
  ai_packages = lib.optional config.common.development.ai.enable (
    with pkgs;
    [
      aichat
      upscayl
      video2x
    ]
  );
  host_name = config.networking.hostName;
in
{
  config = lib.mkIf config.common.development.enable {
    services = {
      postgresql = {
        enable = true;
        ensureDatabases = [ host_name ];
        enableTCPIP = true;
        # port = 5432;
        authentication = pkgs.lib.mkOverride 10 ''
          #type database DBuser origin-address auth-method
          local all      all     trust
          # ... other auth rules ...

          # ipv4
          host  all      all     127.0.0.1/32   trust
          # ipv6
          host  all      all     ::1/128        trust
        '';
        initialScript = pkgs.writeText "initialScript" ''
          CREATE ROLE ${host_name} WITH LOGIN PASSWORD '${host_name}' CREATEDB;
          CREATE DATABASE ${host_name};
          GRANT ALL PRIVILEGES ON DATABASE ${host_name} TO ${host_name};
        '';
      };
      pgadmin.enable = true;
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
    environment.systemPackages =
      with pkgs;
      [
        zed-editor
        nodejs
        pnpm
        rainfrog
        k9s
        swi-prolog
      ]
      ++ ai_packages;
  };
  options.common.development = {
    enable = lib.mkEnableOption "Common desktop development options";
    ai.enable = lib.mkEnableOption "AI in development.";
  };
}
