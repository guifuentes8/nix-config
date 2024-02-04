{
  description = "My Awesome | guifuentes8 | Nixos Configuration";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

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

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, nix-colors
    , darkmatter-grub-theme, ... }@inputs:

    let
      inherit (self) outputs;
      forEachSystem = nixpkgs.lib.genAttrs [ "x86_64-linux" ];
      forEachPkgs = f: forEachSystem (sys: f nixpkgs.legacyPackages.${sys});
      systemVersion = "23.11";
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
        jameswebb = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs unstable systemVersion; };
          modules = [ darkmatter-grub-theme.nixosModule ./hosts/jameswebb ];
        };
        hubble = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs unstable systemVersion; };
          modules = [ darkmatter-grub-theme.nixosModule ./hosts/hubble ];
        };
      };

      homeConfigurations = {
        "cli2nix@jameswebb" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = {
            inherit unstable systemVersion nix-colors inputs outputs;
          };
          modules = [ ./home/cli2nix/jameswebb.nix ];
        };
        "cli2nix@hubble" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."-linux";
          extraSpecialArgs = {
            inherit unstable systemVersion nix-colors inputs outputs;
          };
          modules = [ ./home/cli2nix/hubble.nix ];
        };
      };
    };

}
