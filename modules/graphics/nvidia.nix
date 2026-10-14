{
  config,
  pkgs,
  ...
}:
{
  imports = [ ./default.nix ];

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    open = true;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true; # nvidia-offload %command%
      };

      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";

      sync.enable = false; # only enable if you hate your laptop
      reverseSync.enable = false; # this is a laptop, please NEVER enable
    };
    powerManagement = {
      enable = true;
      finegrained = true;
    };
    modesetting.enable = true;
  };
  environment.systemPackages = with pkgs; [
    nvtopPackages.nvidia
    vulkan-tools
  ];

  # WARNING: This option WILL cause all programs with cuda support to compile from source IF binary caches is not set.
  nixpkgs.config.cudaSupport = false;
}
