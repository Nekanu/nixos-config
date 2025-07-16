{ pkgs, username, ... }:
{
  programs.adb.enable = true; # Android Debug Bridge is used by DroidCam for USB connection
  users.groups.adbusers.members = [ username ];

  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-vaapi
      obs-gstreamer
      obs-pipewire-audio-capture
      droidcam-obs
    ];
  };

  security.polkit.enable = true;
}
