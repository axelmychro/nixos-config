_: {
  virtualisation.docker.enable = true;
  hardware.nvidia-container-toolkit.enable = true;
  users.users.axel.extraGroups = [ "docker" ];
}
