{
  description = "Nekanu's NixOS configuration";

  inputs = {

    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # You can access packages and modules from different nixpkgs revs
    # at the same time. Here's an working example:

    nur.url = github:nix-community/NUR;

    disko.url = "github:nix-community/disko";

    # Version of nixpkgs where pCloud doesn't crash
    # See https://github.com/NixOS/nixpkgs/issues/226339
    nixpkgs-unstable-pcloud-ok.url = "github:NixOS/nixpkgs/e3652e0735fbec227f342712f180f4f21f0594f2";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nix-software-center.url = "github:vlinkz/nix-software-center";

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

    # Generator
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    grub-themes.url = "github:vinceliuice/grub2-themes";
  };

  outputs = { self, nixpkgs, ... } @ inputs:
    let
      inherit (self) outputs;
      forAllSystems = nixpkgs.lib.genAttrs [
        "x86_64-linux"
      ];
      stateVersion = "23.11";
      rootPath = ./.;
      nur-modules = import inputs.nur rec {
        nurpkgs = nixpkgs.legacyPackages.x86_64-linux;
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
      };
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
        inputs.plasma-manager.homeManagerModules.plasma-manager
        inputs.nix-flatpak.homeManagerModules.nix-flatpak
      ];
    in
    rec {
      # Your custom packages
      # Acessible through 'nix build', 'nix shell', etc
      packages = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in import ./pkgs { inherit pkgs; }
      );
      # Devshell for bootstrapping
      # Acessible through 'nix develop' or 'nix-shell' (legacy)
      devShells = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in import ./shell.nix { inherit pkgs; }
      );

      # Your custom packages and modifications, exported as overlays
      overlays = import ./overlays { inherit nixpkgs inputs; };

      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations = {

        harmony = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs stateVersion rootPath config-repository;
            desktopEnvironments = [ "plasma6" "hyprland" ];
            additionalFeatures = [ "development" "gaming" "virtualisation" "nixos-generators" ];
            hostname = "harmony";
            username = "${username}";
            hostid = "a69480bd";
          };
          modules = defaultSystemModules ++ [
            home-manager.nixosModules.home-manager {
              # home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users."${username}" = import ./home;
              home-manager.extraSpecialArgs = {
                inherit inputs outputs stateVersion rootPath config-repository;
                desktopEnvironments = [ "plasma6" ];
                additionalFeatures = [ "development" "gaming" ];
                hostname = "harmony";
                username = "${username}";
              };
              home-manager.sharedModules = defaultHomeModules;
            }
          ];
        };

        opportunity = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs stateVersion rootPath config-repository;
            desktopEnvironments = [ "plasma6" ];
            additionalFeatures = [ "development" "virtualisation" ];
            hostname = "opportunity";
            username = "${username}";
            hostid = "2b927153";
          };
          modules = defaultSystemModules ++ [
            home-manager.nixosModules.home-manager {
              # home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users."${username}" = import ./home;
              home-manager.extraSpecialArgs = {
                inherit inputs outputs stateVersion rootPath config-repository;
                desktopEnvironments = [ "plasma6" "hyprland" ];
                additionalFeatures = [ "development" ];
                hostname = "opportunity";
                username = "${username}";
              };
              home-manager.sharedModules = defaultHomeModules;
            }
          ];
        };

        vm = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs stateVersion rootPath config-repository;
            desktopEnvironments = [ "plasma6" "hyprland" ];
            additionalFeatures = [ "nixos-generators" ];
            hostname = "vm";
            username = "${username}";
            hostid = "49334979";
          };
          modules = defaultSystemModules ++ [
            home-manager.nixosModules.home-manager {
              # home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users."${username}" = import ./home;
              home-manager.extraSpecialArgs = {
                inherit inputs outputs stateVersion rootPath config-repository;
                desktopEnvironments = [ "plasma6" "hyprland" ];
                additionalFeatures = [ "development" ];
                hostname = "vm";
                username = "${username}";
              };
              home-manager.sharedModules = defaultHomeModules;
            }
          ];
        };

        wsl-nixos = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs stateVersion rootPath config-repository;
            desktopEnvironments = [ ];
            additionalFeatures = [ "development" ];
            hostname = "wsl-nixos";
            username = "${username}";
            hostid = "48954894";
          };
          modules = defaultSystemModules
            ++ [inputs.nixos-wsl.nixosModules.default]
            ++ [
              home-manager.nixosModules.home-manager {
                # home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users."${username}" = import ./home;
                home-manager.extraSpecialArgs = {
                  inherit inputs outputs stateVersion rootPath config-repository;
                  desktopEnvironments = [ ];
                  additionalFeatures = [ "development" ];
                  hostname = "wsl-nixos";
                  username = "${username}";
                };
                home-manager.sharedModules = defaultHomeModules;
              }
          ];
        };
      };
    };
}
