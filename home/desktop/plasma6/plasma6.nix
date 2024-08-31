{ config, lib, pkgs, ... }:
{
  programs.plasma = {
    enable = true;

    workspace = {
      clickItemTo = "select";
    };

    # Enable NumLock on startup
    configFile."kcminputrc".Keyboard.NumLock.value = 0;
  };

  home.packages = with pkgs; [
    xdg-desktop-portal-kde
  ];
}
