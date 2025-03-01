{ pkgs, ... }:
{
  environment =
    let
      dotnet-combined =
        (
          with pkgs.dotnetCorePackages;
          combinePackages [
            dotnet_8.sdk
            dotnet_8.runtime
          ]
        ).overrideAttrs
          (
            finalAttrs: previousAttrs: {
              # This is needed to install workload in $HOME
              # https://discourse.nixos.org/t/dotnet-maui-workload/20370/2

              postBuild =
                (previousAttrs.postBuild or '''')
                + ''

                  for i in $out/sdk/*
                  do
                    i=$(basename $i)
                    mkdir -p $out/metadata/workloads/''${i/-*}
                    touch $out/metadata/workloads/''${i/-*}/userlocal
                  done
                '';
            }
          );
    in
    {
      sessionVariables = {
        # DOTNET_ROOT = "${dotnet-combined}";
      };
      systemPackages = [
        dotnet-combined
      ];
    };
}
