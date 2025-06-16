{
  description = "Nekanu's NixOS configuration";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
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
      stateVersion = "25.05";
      rootPath = ./.;
      config-repository = "gitlab:Nekanu/nixos-config";

      username = "nekanu";

      defaultSystemModules = [
        ./nixos
        inputs.disko.nixosModules.disko
        inputs.grub-themes.nixosModules.default
        inputs.nur.modules.nixos.default
        inputs.nix-flatpak.nixosModules.nix-flatpak
        self.nixosModules.generatorFormats
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
      devShells = eachSystem (pkgs: import ./shell.nix { inherit pkgs; });

      formatter = eachSystem (pkgs: treefmtEval.${pkgs.system}.config.build.wrapper);

      packages = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        import ./pkgs { inherit pkgs; }
      );

      # Make all generator formats available to nixosConfigurations
      nixosModules.generatorFormats = {
        imports = [
          inputs.nixos-generators.nixosModules.all-formats
        ];
        nixpkgs.hostPlatform = "x86_64-linux";
      };

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
            desktopEnvironments = [ "plasma6" "hyprland" ];
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
              username
              ;
            desktopEnvironments = [ "plasma6" ];
            additionalFeatures = [
              "development"
              "drawing"
            ];
            hostname = "opportunity";
            hostid = "2b927153";
            disks = [ "/dev/nvme0n1" ];
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
              username
              ;
            desktopEnvironments = [
              "plasma6"
              "hyprland"
            ];
            additionalFeatures = [ ];
            hostname = "vm";
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
              username
              ;
            desktopEnvironments = [ ];
            additionalFeatures = [ "development" ];
            hostname = "wsl-nixos";
            hostid = "48954894";
          };
          modules = defaultSystemModules ++ [
            inputs.nixos-wsl.nixosModules.default
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit
                  inputs
                  outputs
                  stateVersion
                  rootPath
                  config-repository
                  username
                  ;
                desktopEnvironments = [ ];
                additionalFeatures = [ "development" ];
                hostname = "wsl-nixos";
              };
              home-manager.sharedModules = defaultHomeModules;
            }
          ];
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
            desktopEnvironments = [ "plasma6" "hyprland" ];
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
      };

      checks = eachSystem (pkgs: {
        pre-commit-check = inputs.pre-commit-hooks.lib.${pkgs.system}.run {
          src = ./.;
          hooks = {
            nixfmt-rfc-style.enable = true;
          };
        };
        formatting = treefmtEval.${pkgs.system}.config.build.check self;
      });
    };
}
