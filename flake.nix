{

  # ███████╗██╗      █████╗ ██╗  ██╗███████╗
  # ██╔════╝██║     ██╔══██╗██║ ██╔╝██╔════╝
  # █████╗  ██║     ███████║█████╔╝ █████╗
  # ██╔══╝  ██║     ██╔══██║██╔═██╗ ██╔══╝
  # ██║     ███████╗██║  ██║██║  ██╗███████╗
  # ╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝

  description = "My Awesome | gui8 | Nixos Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/nix-darwin-24.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-wsl.url = "github:nix-community/NixOS-WSL";
    nix-wsl.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Others flakes
    sops-nix.url = "github:Mic92/sops-nix";
    stylix.url = "github:danth/stylix/release-24.11";
    nixvim.url = "github:nix-community/nixvim/nixos-24.11";
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nh_plus.url = "github:ToyVo/nh_plus";
  };

  outputs =
    { self, nixpkgs, nix-darwin, home-manager, sops-nix, stylix, ... }@inputs:
    let
      inherit (self) outputs;

      forEachSystem = nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      forEachPkgs = f: forEachSystem (sys: f nixpkgs.legacyPackages.${sys});

    in {
      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;
      overlays = import ./overlays { inherit inputs outputs; };
      packages = forEachPkgs (pkgs: import ./pkgs { inherit pkgs; });
      devShells = forEachPkgs (pkgs: import ./shell.nix { inherit pkgs; });

      #        ╔═╗╦ ╦╔╗╔
      #        ╚═╗║ ║║║║
      #        ╚═╝╚═╝╝╚╝

      homeConfigurations."gui8@pokecenter" =
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            stylix.homeManagerModules.stylix
            sops-nix.homeManagerModules.sops
            inputs.nixvim.homeManagerModules.nixvim

            ./home/pokecenter.nix
          ];
        };
      nixosConfigurations.pokecenter = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          stylix.nixosModules.stylix
          sops-nix.nixosModules.sops
          ./hosts/pokecenter
        ];
      };

      #        ┌┬┐┌─┐┬─┐┌─┐┬ ┬┬─┐┬ ┬
      #        │││├┤ ├┬┘│  │ │├┬┘└┬┘
      #        ┴ ┴└─┘┴└─└─┘└─┘┴└─ ┴

      homeConfigurations."gui8@eevee" =
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            stylix.homeManagerModules.stylix
            sops-nix.homeManagerModules.sops
            inputs.nixvim.homeManagerModules.nixvim
            ./home/eevee.nix
          ];
        };

      nixosConfigurations.eevee = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          sops-nix.nixosModules.sops
          stylix.nixosModules.stylix
          ./hosts/eevee
        ];
      };

      #        ┬  ┬┌─┐┌┐┌┬ ┬┌─┐
      #        └┐┌┘├┤ ││││ │└─┐
      #         └┘ └─┘┘└┘└─┘└─┘

      homeConfigurations."gui8@flareon" =
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            sops-nix.homeManagerModules.sops
            stylix.homeManagerModules.stylix
            inputs.nixvim.homeManagerModules.nixvim
            ./home/flareon.nix
          ];
        };
      nixosConfigurations.flareon = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          sops-nix.nixosModules.sops
          stylix.nixosModules.stylix
          ./hosts/flareon
        ];
      };

      #        ┌─┐┌─┐┬─┐┌┬┐┬ ┬
      #        ├┤ ├─┤├┬┘ │ ├─┤
      #        └─┘┴ ┴┴└─ ┴ ┴ ┴

      homeConfigurations."gui8@jolteon" =
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [ stylix.homeManagerModules.stylix ./home/jolteon.nix ];
        };
      nixosConfigurations.jolteon = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [
          stylix.nixosModules.stylix
          sops-nix.nixosModules.sops
          ./hosts/jolteon
        ];
      };

      #        ┌┬┐┌─┐┬─┐┌─┐
      #        │││├─┤├┬┘└─┐
      #        ┴ ┴┴ ┴┴└─└─┘

      homeConfigurations."gui8@vaporeon" =
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [ stylix.homeManagerModules.stylix ./home/vaporeon.nix ];
        };
      nixosConfigurations.vaporeon = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [ sops-nix.nixosModules.sops ./hosts/vaporeon ];
      };

      #         ┬┬ ┬┌─┐┬┌┬┐┌─┐┬─┐
      #         ││ │├─┘│ │ ├┤ ├┬┘
      #        └┘└─┘┴  ┴ ┴ └─┘┴└─

      homeConfigurations."gui8@umbreon" =
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [ stylix.homeManagerModules.stylix ./home/umbreon.nix ];
        };
      nixosConfigurations.umbreon = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [ sops-nix.nixosModules.sops ./hosts/umbreon ];
      };

      darwinConfigurations."espeon" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit inputs outputs; };
        modules = [
          ./hosts/espeon
          home-manager.darwinModules.home-manager

          {
            home-manager = {
              extraSpecialArgs = { inherit inputs outputs; };
              sharedModules = [
                stylix.homeManagerModules.stylix
                inputs.nixvim.homeManagerModules.nixvim
                sops-nix.homeManagerModules.sops

              ];
              useUserPackages = true;
              # useGlobalPkgs = true;
              users.administrador.imports = [
                ./home/espeon.nix

              ];
              backupFileExtension = "backup";
            };
          }

        ];
      };

      darwinPackages = self.darwinConfigurations."espeon".pkgs;
    };
}
