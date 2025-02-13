{
  description = "An example Swift package";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = { nixpkgs, ... }:
    let
      forAllSystems = gen:
        nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed
        (system: gen nixpkgs.legacyPackages.${system});
    in {
      packages = forAllSystems (pkgs: { default = pkgs.callPackage ./. { }; });

      devShells = forAllSystems (pkgs: { default = pkgs.mkShell {
        buildInputs = [ pkgs.swift pkgs.swiftpm pkgs.swiftpm2nix pkgs.swiftPackages.Foundation ];
      }; });
    };
}
