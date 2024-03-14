{
  description = "My Awesome | guifuentes8 | Nixos Configuration";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-wsl.url = "github:nix-community/NixOS-WSL";
    nix-wsl.inputs.nixpkgs.follows = "nixpkgs";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors.url = "github:misterio77/nix-colors";
    hyprland.url = "github:hyprwm/hyprland";

    darkmatter-grub-theme = {
      url = "gitlab:VandalByte/darkmatter-grub-theme";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, nixpkgs-unstable, nix-darwin, home-manager, nix-wsl
    , nix-colors, darkmatter-grub-theme, ... }@inputs:

    let
      inherit (self) outputs;
      forEachSystem = nixpkgs.lib.genAttrs [ "x86_64-linux" "x86_64-darwin" ];
      forEachPkgs = f: forEachSystem (sys: f nixpkgs.legacyPackages.${sys});
      systemVersion = "23.11";
      # windowsUser = "Larquim\\ Arquitetura";
      windowsUser = "Guilherme\\ Fuentes";
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

      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs unstable systemVersion windowsUser;
          };
          modules = [ darkmatter-grub-theme.nixosModule ./hosts/nixos ];
        };
        silverblue = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs unstable systemVersion windowsUser;
          };
          modules = [ darkmatter-grub-theme.nixosModule ./hosts/silverblue ];
        };
        wsl = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs unstable systemVersion nix-colors
              windowsUser;
          };
          modules = [ ./hosts/wsl ];
        };

      };
      darwinConfigurations."mac" =
        nix-darwin.lib.darwinSystem { modules = [ ./hosts/darwin ]; };
      darwinPackages = self.darwinConfiguration."mac".pkgs;

      homeConfigurations = {
        "guifuentes8@nixos" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = {
            inherit unstable systemVersion nix-colors inputs outputs
              windowsUser;
          };
          modules = [ ./home/guifuentes8/nixos.nix ];
        };
        "guifuentes8@silverblue" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = {
            inherit unstable systemVersion nix-colors inputs outputs;
          };
          modules = [ ./home/guifuentes8/silverblue.nix ];
        };
        "guifuentes8@windows" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = {
            inherit unstable systemVersion nix-colors inputs outputs;
          };
          modules = [ ./home/guifuentes8/windows.nix ];
        };

      };
    };

}
