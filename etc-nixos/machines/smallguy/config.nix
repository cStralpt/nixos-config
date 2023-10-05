{
  lib,
  inputs,
  system,
  config,
  pkgs,

  username,
  fullname,
  ...
}:

{
  imports = [
    ./hardware-config.nix
    ./../../global-config.nix
  ];

  # Hostname
  networking.hostName = "SmallGuy";

  # Graphics driver shit:
  # https://nixos.wiki/wiki/Accelerated_Video_Playback
  hardware.opengl.extraPackages = with pkgs; [
    intel-media-driver # LIBVA_DRIVER_NAME=iHD
    vaapiIntel         # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
    vaapiVdpau
    libvdpau-va-gl
  ];
}
