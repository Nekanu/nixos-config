{ config, pkgs, ... }:
{
  programs.plasma = {
    window-rules = [
      {
        description = "Firefox Picture-In-Picture";
        match = {
          window-class = "firefox";
          title = "Picture-In-Picture";
        };
        apply = {

        };
      }
    ];
  };
}
