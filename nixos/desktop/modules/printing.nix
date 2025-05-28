{ pkgs, ... }:
{
  services = {

    avahi = {
      enable = true;
      nssmdns4 = true;
      nssmdns6 = true;
      openFirewall = true;
    };

    printing = {
      enable = true;
      drivers = [
        pkgs.gutenprint
        (pkgs.writeTextDir "share/cups/model/oki-mc853.ppd" (
          builtins.readFile ../../../modules/drivers/printing/oki-mc853.ppd
        ))
      ];
    };
  };
}
