{
  pkgs,
  ...
}:
{
  hardware.graphics.extraPackages = with pkgs; [
    intel-media-driver
    vpl-gpu-rt
    intel-compute-runtime
  ];
  services.xserver.videoDrivers = [
    "modesetting"
  ];
  environment = {
    sessionVariables = {
      LIBVA_DRIVER_NAME = "iHD";
    };
    #systemPackages = with pkgs; [
    #  libva-utils
    #  mesa-demos
    #];
  };
  #boot.kernelParams = [ "i915.enable_guc=3" ];
}
