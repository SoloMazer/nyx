{
	description = " Main system flake ";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
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

	outputs = { nixpkgs, ... }@inputs:
let 
		system = "x86_64-linux";
in
	{
		nixosConfigurations = {
			nixos = nixpkgs.lib.nixosSystem {
        inherit system;
				specialArgs = { inherit inputs; };
				modules = [
					./hosts/flaky/configuration.nix
					inputs.home-manager.nixosModules.home-manager
					inputs.nixvim.nixosModules.nixvim
          inputs.nix-flatpak.nixosModules.nix-flatpak
				];
			};
		};
	};
}

