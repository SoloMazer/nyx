{
	description = " Main system flake ";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
    	inputs.nixpkgs.follows = "nixpkgs";
		};
		nixvim = {
			url = "github:nix-community/nixvim";
    	inputs.nixpkgs.follows = "nixpkgs";
		};
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    hyprland.url = "github:hyprwm/Hyprland"; 
	};
	outputs = { self, nixpkgs, ... }@inputs:
let 
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
in
	{
		nixosConfigurations = {
			nixos = nixpkgs.lib.nixosSystem {
				specialArgs = { inherit inputs; };
				modules = [
					./configuration.nix
					inputs.home-manager.nixosModules.home-manager
					inputs.nixvim.nixosModules.nixvim
          inputs.nix-flatpak.nixosModules.nix-flatpak
				];
			};
		};
	};
}

