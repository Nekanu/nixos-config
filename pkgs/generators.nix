{ ... }:
{
  install-iso = nixos-generators.nixosGenerate {
    format = "install-iso";
  };
}
