{
  description = "My first flake!";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    #nixpkgs.url = "nixpkgs/nixos-24.05";
    #nixpkgs-unstable.url = "nixpkgs/nixpkgs-unstable";
    #home-manager.url = "github:nix-community/home-manager/release-24.05";
  };

  outputs = {
    self,
    nixpkgs,
    #nixpkgs-unstable,
    home-manager,
    ...
  }: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      # Thinkpad T480 (Intel)
      nixos = lib.nixosSystem {
        inherit system;
        modules = [./configuration.nix];
      };
    };

    homeConfigurations = {
      olauslintinen = home-manager.lib.homeManagerConfiguration {
        #this was originally the only one
        inherit pkgs;
        extraSpecialArgs = {
        };
        modules = [
          ./home.nix
        ];
      };
    };
  };
}
