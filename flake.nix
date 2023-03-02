{
  description = "My Awesome System Config Nixos";

  inputs = {

    # Nixpkgs
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager/release-22.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";
    swww.url = "github:/Horus645/swww";

  };

  outputs = { self, nixpkgs, home-manager, hyprland, swww, ... }@inputs:
    let
      inherit (self) outputs;
      forEachSystem = nixpkgs.lib.genAttrs [ "x86_64-linux" ];
      forEachPkgs = f: forEachSystem (sys: f nixpkgs.legacyPackages.${sys});

      pkgs = import nixpkgs { config = { allowUnfree = true; }; };

    in
    rec
    {
      packages = forEachPkgs (pkgs: import ./pkgs { inherit pkgs; });

      # # Devshell for bootstrapping
      # # Acessible through 'nix develop' or 'nix-shell' (legacy)
      # devShells = forAllSystems (system:
      #   let pkgs = nixpkgs.legacyPackages.${system};
      #   in import ./shell.nix { inherit pkgs; }
      # );

      # Your custom packages and modifications, exported as overlays
      # overlays = import ./overlays { inherit inputs; };
      # # Reusable nixos modules you might want to export
      # # These are usually stuff you would upstream into nixpkgs
      # nixosModules = import ./modules/nixos;
      # # Reusable home-manager modules you might want to export
      # # These are usually stuff you would upstream into home-manager
      # homeManagerModules = import ./modules/home-manager;

      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            # ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
            ./system/configuration.nix
            hyprland.nixosModules.default
            swww.nixosModules.default
            { programs.hyprland.enable = true; }
          ];
        };
      };
      homeConfigurations = {
        guifuentes8 = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            # ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
            ./users/guifuentes8/home.nix
            hyprland.homeManagerModules.default
            { wayland.windowManager.hyprland.enable = true; }
          ];
        };
      };


    };

}
