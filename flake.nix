{
  description = "Nekanu's NixOS configuration";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nur.url = "github:nix-community/NUR";

    disko.url = "github:nix-community/disko";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    plasma-manager = {
      url = "github:pjones/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    grub-themes.url = "github:vinceliuice/grub2-themes";

    treefmt-nix.url = "github:numtide/treefmt-nix";
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
  };

  outputs =
    {
      self,
      nixpkgs,
      systems,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      forAllSystems = nixpkgs.lib.genAttrs [ "x86_64-linux" ];
      stateVersion = "24.11";
      rootPath = ./.;
      config-repository = "gitlab:Nekanu/nixos-config";

      username = "nekanu";

      defaultSystemModules = [
        ./nixos
        inputs.disko.nixosModules.disko
        inputs.grub-themes.nixosModules.default
        inputs.nur.modules.nixos.default
        inputs.nix-flatpak.nixosModules.nix-flatpak
      ];

      defaultHomeModules = [
        ./home
        inputs.plasma-manager.homeManagerModules.plasma-manager
        inputs.nix-flatpak.homeManagerModules.nix-flatpak
      ];

      eachSystem = f: nixpkgs.lib.genAttrs (import systems) (system: f nixpkgs.legacyPackages.${system});

      treefmtEval = eachSystem (pkgs: inputs.treefmt-nix.lib.evalModule pkgs ./treefmt.nix);
    in
    {
      # Your custom packages
      # Acessible through 'nix build', 'nix shell', etc
      packages = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        import ./pkgs { inherit pkgs; }
      );

      # Your custom packages and modifications, exported as overlays
      overlays = import ./overlays { inherit nixpkgs inputs; };

      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations = {

        harmony = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit
              inputs
              outputs
              stateVersion
              rootPath
              config-repository
              ;
            desktopEnvironments = [ "plasma6" ];
            additionalFeatures = [
              "development"
              "gaming"
              "virtualisation"
              "drawing"
            ];
            hostname = "harmony";
            username = "${username}";
            hostid = "a69480bd";
          };
          modules = defaultSystemModules;
        };

        opportunity = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit
              inputs
              outputs
              stateVersion
              rootPath
              config-repository
              ;
            desktopEnvironments = [ "plasma6" ];
            additionalFeatures = [
              "development"
              "virtualisation"
              "drawing"
            ];
            hostname = "opportunity";
            username = "${username}";
            hostid = "2b927153";
          };
          modules = defaultSystemModules;
        };

        vm = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit
              inputs
              outputs
              stateVersion
              rootPath
              config-repository
              ;
            desktopEnvironments = [
              "plasma6"
              "hyprland"
            ];
            additionalFeatures = [ ];
            hostname = "vm";
            username = "${username}";
            hostid = "49334979";
          };
          modules = defaultSystemModules;
        };

        wsl-nixos = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit
              inputs
              outputs
              stateVersion
              rootPath
              config-repository
              ;
            desktopEnvironments = [ ];
            additionalFeatures = [ "development" ];
            hostname = "wsl-nixos";
            username = "${username}";
            hostid = "48954894";
          };
          modules = defaultSystemModules ++ [ inputs.nixos-wsl.nixosModules.default ];
        };
      };

      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager --flake .#your-username@your-hostname'
      homeConfigurations = {
        "nekanu@harmony" = inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = {
            inherit
              inputs
              outputs
              stateVersion
              rootPath
              config-repository
              ;
            desktopEnvironments = [ "plasma6" ];
            additionalFeatures = [
              "gaming"
              "development"
              "drawing"
            ];
            hostname = "harmony";
            username = "nekanu";
          };
          modules = defaultHomeModules;
        };

        "nekanu@opportunity" = inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = {
            inherit
              inputs
              outputs
              stateVersion
              rootPath
              config-repository
              ;
            desktopEnvironments = [ "plasma6" ];
            additionalFeatures = [
              "development"
              "drawing"
            ];
            hostname = "opportunity";
            username = "nekanu";
          };
          modules = defaultHomeModules;
        };

        "nekanu@vm" = inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = {
            inherit
              inputs
              outputs
              stateVersion
              rootPath
              config-repository
              ;
            desktopEnvironments = [
              "plasma6"
              "hyprland"
            ];
            additionalFeatures = [ ];
            hostname = "vm";
            username = "nekanu";
          };
          modules = defaultHomeModules;
        };

        "nekanu@wsl-nixos" = inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = {
            inherit
              inputs
              outputs
              stateVersion
              rootPath
              config-repository
              ;
            desktopEnvironments = [ ];
            additionalFeatures = [ "development" ];
            hostname = "wsl-nixos";
            username = "nekanu";
          };
          modules = defaultHomeModules;
        };
      };

      formatter = eachSystem (pkgs: treefmtEval.${pkgs.system}.config.build.wrapper);

      checks = eachSystem (pkgs: {
        pre-commit-check = inputs.pre-commit-hooks.lib.${pkgs.system}.run {
          src = ./.;
          hooks = {
            nixfmt-rfc-style.enable = true;
          };
        };
        formatting = treefmtEval.${pkgs.system}.config.build.check self;
      });

      devShells = eachSystem (pkgs: {
        default = pkgs.mkShell {
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
      });
    };

}
