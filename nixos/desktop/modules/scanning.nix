{ pkgs, ... }:
{
  hardware.sane = {
    enable = true;
    extraBackends = with pkgs; [
      sane-airscan
    ];
  };
}
