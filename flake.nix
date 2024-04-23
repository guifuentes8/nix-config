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
    nur.url = "github:nix-community/NUR";

    darkmatter-grub-theme = {
      url = "gitlab:VandalByte/darkmatter-grub-theme";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, nixpkgs-unstable, nix-darwin, home-manager, nix-wsl
    , nur, nix-colors, darkmatter-grub-theme, ... }@inputs:
    let
      inherit (self) outputs;
      forEachSystem = nixpkgs.lib.genAttrs [ "x86_64-linux" "x86_64-darwin" ];
      forEachPkgs = f: forEachSystem (sys: f nixpkgs.legacyPackages.${sys});
      pkgs = import nixpkgs { system = "x86_64-linux"; };
      configOptions = {
        systemVersion = "23.11";
        windowsUser = "guifuentes8";
        nextcloudHostname = "https://kim.nl.tab.digital";
        styles = {
          theme = {
            name = "catppuccin";
            variant = "mocha";
          };
          cursor = {
            name = "Catppuccin-Mocha-Dark-Cursors";
            package = pkgs.catppuccin-cursors.mochaDark;
            size = "32";
          };
          gtk = {
            name = "Catppuccin-Mocha-Standard-Blue-Dark";
            package = pkgs.catppuccin-gtk.override {
              accents = [ "blue" ];
              size = "standard";
              tweaks = [ "rimless" ];
              variant = "${configOptions.styles.theme.variant}";
            };
          };
          icon = {
            name = "Papirus-Dark";
            package =
              pkgs.catppuccin-papirus-folders.override { accent = "lavender"; };
          };
          font = {
            code = "MonoLisa";
            main = "JetBrainsMonoNL Nerd Font";
            size = "12";
          };
          keyboard = {
            languageVariant = "br-"; # or "" for us
            layout = "br,us";
            variant = "abnt2";
          };
          wm = {
            borderWidth = "3";
            borderRadius = "12";
            opacity = "0.9";
          };
        };
      };
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
          specialArgs = { inherit inputs outputs unstable configOptions; };
          modules = [ darkmatter-grub-theme.nixosModule ./hosts/nixos ];
        };
        avell = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs unstable configOptions; };
          modules = [ darkmatter-grub-theme.nixosModule ./hosts/avell ];
        };
        wsl = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs unstable configOptions nix-colors;
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
          extraSpecialArgs = { inherit unstable configOptions inputs outputs; };
          modules = [ ./home/guifuentes8/nixos.nix ];
        };
        "guifuentes8@avell" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = {
            inherit unstable configOptions nix-colors inputs outputs;
          };
          modules = [ ./home/guifuentes8/avell.nix ];
        };
        "guifuentes8@windows" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = {
            inherit unstable configOptions nix-colors inputs outputs;
          };
          modules = [ ./home/guifuentes8/windows.nix ];
        };

      };
    };

}
