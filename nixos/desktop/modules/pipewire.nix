{ pkgs, ... }:
{
  services = {
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      audio.enable = true;

      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;

      wireplumber = {
        enable = true;

        extraLv2Packages = with pkgs; [
          lsp-plugins
        ];
      };
    };
  };
  security.rtkit.enable = true;

  environment.systemPackages = with pkgs; [
    qpwgraph
  ];
}
