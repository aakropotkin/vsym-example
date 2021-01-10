{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  buildInputs = [
    gcc
  ];
}
