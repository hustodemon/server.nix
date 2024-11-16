{
  description = "A flake providing a framework for steamlined declarative management of NixOS containers and VMs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    microvm = {
      url = "github:developing-today-forks/microvm.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, microvm, ... }@inputs:
    {
      nixosModules = {
        microvm = microvm.nixosModules.host;
        server = import ./modules;
      };
    };
}
