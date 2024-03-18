# Custom packages, that can be defined similarly to ones from nixpkgs
# Build them using 'nix build .#example' or (legacy) 'nix-build -A example'

{ pkgs ? (import ../nixpkgs.nix) { } }: {
  plasma5-wallpapers-dynamic = pkgs.callPackage ./plasma6/plasma-wallpapers-dynamic.nix { };
}
