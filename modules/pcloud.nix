{ pkgs, lib, system, ... }:

let
  pkgs_22_11 = import
    (pkgs.fetchFromGitHub {
      owner = "nixos";
      repo = "nixpkgs";
      rev = "f7c1500e2eefa58f3c80dd046cba256e10440201";
      hash = "sha256-sDd7QIcMbIb37nuqMrJElvuyE5eVgWuKGtIPP8IWwCc=";
    })
    {
      system = "x86_64-linux";
      config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
        "pcloud"
      ];
    };

  pcloud_22_11 = pkgs_22_11.pcloud.overrideAttrs (prev:
    let
      version = "1.14.5";
      code = "XZ0AMJ0ZdrENNeVMNI4Tz3lO1nxr577ryOMV";
      # Archive link's codes: https://www.pcloud.com/release-notes/linux.html
      src = pkgs.fetchzip {
        url = "https://api.pcloud.com/getpubzip?code=${code}&filename=${prev.pname}-${version}.zip";
        hash = "sha256-a577iWPrke3EizG03m0+hjSoPzA4wDai/QMX2Zl7MF0=";
      };

      appimageContents = pkgs.appimageTools.extractType2 {
        name = "${prev.pname}-${version}";
        src = "${src}/pcloud";
      };
    in
    {
      inherit version;
      src = appimageContents;
    });
in

{
  environment.systemPackages = [
    pcloud_22_11
  ];
}
