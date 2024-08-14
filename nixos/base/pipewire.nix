{ config, lib, pkgs, ... }:
{
  hardware = {
    pulseaudio.enable = lib.mkForce false;
  };
  services = {
    pipewire = {
      enable = true;
      audio.enable = true;

      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = true;
      pulse.enable = true;
      
      wireplumber = {
        enable = true;

        extraLv2Packages = with pkgs; [ 
          lsp-plugins
        ];
      };

      extraLv2Packages = with pkgs; [ 
        lsp-plugins
      ];
    };
  };
  security.rtkit.enable = true;

  environment.systemPackages = with pkgs; [
    qpwgraph
    pulseaudio
  ];
}
