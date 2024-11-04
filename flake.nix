{

  # ███████╗██╗      █████╗ ██╗  ██╗███████╗
  # ██╔════╝██║     ██╔══██╗██║ ██╔╝██╔════╝
  # █████╗  ██║     ███████║█████╔╝ █████╗  
  # ██╔══╝  ██║     ██╔══██║██╔═██╗ ██╔══╝  
  # ██║     ███████╗██║  ██║██║  ██╗███████╗
  # ╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝

  description = "My Awesome | guifuentes8 | Nixos Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-wsl.url = "github:nix-community/NixOS-WSL";
    nix-wsl.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Others flakes
    sops-nix.url = "github:Mic92/sops-nix";
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darkmatter-grub-theme.url = "gitlab:VandalByte/darkmatter-grub-theme";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix-darwin, home-manager, nixpkgs-unstable
    , sops-nix, stylix, ... }@inputs:
    let
      inherit (self) outputs;
      forEachSystem = nixpkgs.lib.genAttrs [ "x86_64-linux" "x86_64-darwin" ];
      forEachPkgs = f: forEachSystem (sys: f nixpkgs.legacyPackages.${sys});
      unstable = import nixpkgs-unstable {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };

    in {
      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;
      overlays = import ./overlays { inherit inputs outputs; };
      packages = forEachPkgs (pkgs: import ./pkgs { inherit pkgs; });
      devShells = forEachPkgs (pkgs: import ./shell.nix { inherit pkgs; });

      #        ╔═╗╦ ╦╔╗╔
      #        ╚═╗║ ║║║║
      #        ╚═╝╚═╝╝╚╝

      homeConfigurations."guifuentes8@sun" =
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = { inherit inputs outputs unstable; };
          modules = [
            stylix.homeManagerModules.stylix
            sops-nix.homeManagerModules.sops
            ./home/guifuentes8/sun.nix
          ];
        };
      nixosConfigurations.sun = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs unstable; };
        modules =
          [ stylix.nixosModules.stylix sops-nix.nixosModules.sops ./hosts/sun ];
      };

      #        ┌┬┐┌─┐┬─┐┌─┐┬ ┬┬─┐┬ ┬
      #        │││├┤ ├┬┘│  │ │├┬┘└┬┘
      #        ┴ ┴└─┘┴└─└─┘└─┘┴└─ ┴ 

      homeConfigurations."guifuentes8@mercury" =
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = { inherit inputs outputs unstable; };
          modules = [
            stylix.homeManagerModules.stylix
            sops-nix.homeManagerModules.sops
            ./home/guifuentes8/mercury.nix
          ];
        };

      nixosConfigurations.mercury = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs unstable; };
        modules = [
          stylix.nixosModules.stylix
          sops-nix.nixosModules.sops
          ./hosts/mercury
        ];
      };

      #        ┬  ┬┌─┐┌┐┌┬ ┬┌─┐
      #        └┐┌┘├┤ ││││ │└─┐
      #         └┘ └─┘┘└┘└─┘└─┘

      homeConfigurations."guifuentes8@venus" =
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = { inherit inputs outputs unstable; };
          modules =
            [ stylix.homeManagerModules.stylix ./home/guifuentes8/venus.nix ];
        };
      nixosConfigurations.venus = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs unstable; };
        modules = [
          sops-nix.nixosModules.sops
          stylix.nixosModules.stylix
          ./hosts/venus
        ];
      };

      #        ┌─┐┌─┐┬─┐┌┬┐┬ ┬
      #        ├┤ ├─┤├┬┘ │ ├─┤
      #        └─┘┴ ┴┴└─ ┴ ┴ ┴

      homeConfigurations."guifuentes8@earth" =
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = { inherit inputs outputs unstable; };
          modules =
            [ stylix.homeManagerModules.stylix ./home/guifuentes8/earth.nix ];
        };
      nixosConfigurations.earth = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs unstable; };
        modules = [
          stylix.nixosModules.stylix
          sops-nix.nixosModules.sops
          ./hosts/earth
        ];
      };

      #        ┌┬┐┌─┐┬─┐┌─┐
      #        │││├─┤├┬┘└─┐
      #        ┴ ┴┴ ┴┴└─└─┘

      homeConfigurations."guifuentes8@mars" =
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = { inherit inputs outputs; };
          modules =
            [ stylix.homeManagerModules.stylix ./home/guifuentes8/mars.nix ];
        };
      nixosConfigurations.mars = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [ sops-nix.nixosModules.sops ./hosts/mars ];
      };

      #         ┬┬ ┬┌─┐┬┌┬┐┌─┐┬─┐
      #         ││ │├─┘│ │ ├┤ ├┬┘
      #        └┘└─┘┴  ┴ ┴ └─┘┴└─

      homeConfigurations."guifuentes8@jupiter" =
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = { inherit inputs outputs; };
          modules =
            [ stylix.homeManagerModules.stylix ./home/guifuentes8/jupiter.nix ];
        };
      nixosConfigurations.jupiter = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [ sops-nix.nixosModules.sops ./hosts/jupiter ];

        #        ┌─┐┌─┐┌┬┐┬ ┬┬─┐┌┐┌
        #        └─┐├─┤ │ │ │├┬┘│││
        #        └─┘┴ ┴ ┴ └─┘┴└─┘└┘
        darwinConfigurations."saturn" =
          nix-darwin.lib.darwinSystem { modules = [ ./hosts/saturn ]; };
        darwinPackages = self.darwinConfiguration."saturn".pkgs;
        #        ┬ ┬┬─┐┌─┐┌┐┌┬ ┬┌─┐
        #        │ │├┬┘├─┤││││ │└─┐
        #        └─┘┴└─┴ ┴┘└┘└─┘└─┘
        #        ┌┐┌┌─┐┌─┐┌┬┐┬ ┬┌┐┌┌─┐
        #        │││├┤ ├─┘ │ │ ││││├┤ 
        #        ┘└┘└─┘┴   ┴ └─┘┘└┘└─┘

      };
    };
}
