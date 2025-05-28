{ config, ... }:
{
  nixpkgs.config.packageOverrides = pkgs: {
    nordvpn = config.nur.repos.LuisChDev.nordvpn;
  };

  services.nordvpn.enable = true;
}
