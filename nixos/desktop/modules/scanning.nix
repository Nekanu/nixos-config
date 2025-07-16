{ pkgs, ... }:
{
  hardware.sane = {
    enable = true;
  };

  services.avahi.enable = true;
  services.avahi.nssmdns4 = true;
  services.avahi.nssmdns6 = true;

  environment.systemPackages = [ pkgs.kdePackages.skanpage ];
}
