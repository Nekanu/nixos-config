{
  lib,
  stdenv,
  mkDerivation,
  fetchzip,
  autoPatchelfHook,
  libusb1,
  libX11,
  libXtst,
  qtbase,
  libglvnd,
}:

mkDerivation rec {
  pname = "xp-pen-deco-lw-driver";
  version = "4.0.7";

  src =
    fetchzip {
      url = "https://download01.xp-pen.com/file/2025/02/XPPenLinux4.0.7-250117.tar.gz";
      sha256 = "1r423hcpi26v82pzl59br1zw5vablikclqsy6mcqi0v5p84hfrdd";
    }
    + "/Linux_Pentablet_${version}.tar.gz";

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  buildInputs = [
    libusb1
    libX11
    libXtst
    qtbase
    libglvnd
    (lib.getLib stdenv.cc.cc)
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp Pentablet_Driver $out/bin/pentablet-driver
    cp config.xml $out/bin/config.xml
  '';

  meta = with lib; {
    homepage = "https://www.xp-pen.com/download/deco-lw.html";
    description = "Driver for XP-PEN Deco LW tablet";
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
    license = licenses.unfree;
    platforms = [ "x86_64-linux" ];
    maintainers = [ ];
  };
}
