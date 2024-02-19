{ config, pkgs, ... }:
{
  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-v32n.psf.gz";
    packages = with pkgs; [ terminus_font ];
  };

  fonts = {
    fontDir.enable = true;

    enableDefaultPackages = true;
    enableGhostscriptFonts = true;
    packages = with pkgs; [ 
      terminus_font 
      (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
    ];
  };
}
