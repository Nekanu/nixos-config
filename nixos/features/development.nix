{
  config,
  pkgs,
  rootPath,
  ...
}:
{
  imports = [
    # ../../modules/dotnet.nix
  ];

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [

    # Jetbrains IDEs
    fontconfig
    stdenv.cc.cc
    openssl
    libxcrypt
    lttng-ust_2_12
    musl
    expat
    libxml2
    xz
  ];
}
