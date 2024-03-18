{ stdenv, lib, fetchFromGitHub, cmake, libavif, libexif, kdePackages}:

stdenv.mkDerivation rec {
  pname = "plasma5-wallpapers-dynamic";
  version = "4.4.1";

  src = fetchFromGitHub {
    owner = "zzag";
    repo = pname;
    rev = "${version}";
    hash = "sha256-GXx1h3Q0iautYfC7LBEZDKnEdVA3kAldTh0aSL6VnJw=";
  };

  propagatedUserEnvPkgs = with kdePackages; [
    kdeclarative
    plasma-workspace
  ];

  nativeBuildInputs = [
    cmake
    kdePackages.extra-cmake-modules
    kdePackages.wrapQtAppsHook
    kdePackages.plasma5support
    kdePackages.qtpositioning
  ];

  buildInputs = [
    kdePackages.qtbase
    libavif
    libexif
  ];

  meta = with lib; {
    description = "A wallpaper plugin for KDE Plasma that continuously updates the desktop background based on the current time in your location.";
    homepage = "https://github.com/zzag/plasma5-wallpapers-dynamic";
    platforms = platforms.all;
  };
}