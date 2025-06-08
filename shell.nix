# Shell for bootstrapping flake-enabled nix and home-manager
# Enter it through 'nix develop' or (legacy) 'nix-shell'

{
  pkgs ? (import ./nixpkgs.nix) { },
}:
{
  default = pkgs.mkShell {
    # Enable experimental features without having to specify the argument
    NIX_CONFIG = "experimental-features = nix-command flakes";
    packages = with pkgs; [
      nixd
      nil
      nixos-generators
      nixf
      nixel
      nixci
      nix-diff
      nix-health
      nixpkgs-fmt
      nix-index
      nixfmt-rfc-style
    ];
  };
}
