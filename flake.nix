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
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix.url = "github:Mic92/sops-nix";
    darkmatter-grub-theme = {
      url = "gitlab:VandalByte/darkmatter-grub-theme";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    { self
    , nixpkgs
    , nixpkgs-unstable
    , nix-darwin
    , home-manager
    , sops-nix
    , nix-colors
    , ...
    }@inputs:
    let
      inherit (self) outputs;
      forEachSystem = nixpkgs.lib.genAttrs [ "x86_64-linux" "x86_64-darwin" ];
      forEachPkgs = f: forEachSystem (sys: f nixpkgs.legacyPackages.${sys});
      pkgs = import nixpkgs { system = "x86_64-linux"; };
      configOptions = {
        systemVersion = "23.11";
        windowsUser = "guifuentes8";
        nextcloudHostname = "http://192.168.0.8";
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
            name = "Catppuccin-Mocha-Standard-Sapphire-Dark";
            package = pkgs.catppuccin-gtk.override {
              accents = [ "sapphire" ];
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
            borderWidth = "2";
            borderRadius = "6";
            opacity = "0.8";
          };
        };
      };
      unstable = import nixpkgs-unstable {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };

    in
    {
      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;
      overlays = import ./overlays { inherit inputs outputs; };
      packages = forEachPkgs (pkgs: import ./pkgs { inherit pkgs; });
      devShells = forEachPkgs (pkgs: import ./shell.nix { inherit pkgs; });

      homeConfigurations = {
        "guifuentes8@Charizard" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = {
            inherit unstable nix-colors configOptions inputs outputs;
          };
          modules = [ ./home/guifuentes8/charizard.nix ];
        };
        "guifuentes8@Pikachu" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = {
            inherit unstable configOptions nix-colors inputs outputs;
          };
          modules = [ ./home/guifuentes8/pikachu.nix ];
        };
        "guifuentes8@Squirtle" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = {
            inherit unstable configOptions nix-colors inputs outputs;
          };
          modules = [ ./home/guifuentes8/squirtle.nix ];
        };

        "guifuentes8@Magikarp" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = {
            inherit unstable configOptions nix-colors inputs outputs;
          };
          modules = [ ./home/guifuentes8/magikarp.nix ];
        };
        "guifuentes8@PokeCenter" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = {
            inherit unstable configOptions nix-colors inputs outputs;
          };
          modules = [ ./home/guifuentes8/pokecenter.nix ];
        };
      };
      nixosConfigurations = {
        charizard = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs unstable configOptions; };
          modules = [ sops-nix.nixosModules.sops ./hosts/Charizard ];
        };
        pikachu = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs unstable configOptions; };
          modules = [ sops-nix.nixosModules.sops ./hosts/Pikachu ];
        };
        squirtle = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs unstable configOptions nix-colors;
          };
          modules = [ sops-nix.nixosModules.sops ./hosts/Squirtle ];
        };

        magikarp = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs unstable configOptions nix-colors;
          };
          modules = [ sops-nix.nixosModules.sops ./hosts/Magikarp ];
        };

        pokecenter = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs unstable configOptions nix-colors;
          };
          modules = [ sops-nix.nixosModules.sops ./hosts/PokeCenter ];
        };

      };
      darwinConfigurations."mew" =
        nix-darwin.lib.darwinSystem { modules = [ ./hosts/Mew ]; };
      darwinPackages = self.darwinConfiguration."mew".pkgs;

    };
}
