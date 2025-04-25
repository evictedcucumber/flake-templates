{
  description = "A default C++ flake.";

  inputs.nixpkgs.url = "nixpkgs/nixos-unstable";

  outputs = {nixpkgs, ...}: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    devShells.${system}.default = pkgs.mkShell.override {stdenv = pkgs.clang19Stdenv;} {
      name = "";
      packages = with pkgs; [clang-tools];
    };
  };
}
