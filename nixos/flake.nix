{
  description = "My NixOS configuration";

  inputs = {
    # NixOS official package source, using the nixos-24.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
  };

  outputs = {
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    nixvim,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    user = "ehllay";
    pkgs-unstable = import nixpkgs-unstable {
      inherit system;
      # Allow predicate no worky with unstable pkgs :(
      # config.allowUnfree = true;
    };
  in {
    nixosConfigurations = {
      nixos-lap = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
          ./hosts/nixos-lap
          ./modules

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.sharedModules = [nixvim.homeManagerModules.nixvim];
            home-manager.users.${user} = import ./home;
            home-manager.extraSpecialArgs = {
              inherit inputs user pkgs-unstable;
            };
          }
          inputs.stylix.nixosModules.stylix
        ];

        specialArgs = {inherit inputs;};
      };
    };
  };
}
