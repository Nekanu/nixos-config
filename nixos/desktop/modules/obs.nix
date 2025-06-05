{ config, pkgs, ... }:
{
  programs.adb.enable = true; # Android Debug Bridge is used by DroidCam for USB connection

  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-vkcapture
      obs-vaapi
      obs-gstreamer
      obs-pipewire-audio-capture
      obs-advanced-masks
      obs-backgroundremoval
      obs-noise
      obs-replay-source
      obs-tuna
      waveform
      droidcam-obs
    ];
  };
}
