{config, pkgs, lib, ...}:

# shell.nix

{ pkgs ? import <nixpkgs> {} }:
with pkgs; # Same for pkgs.
mkShell {
  buildInputs = [
    # Defines a python + set of packages.
    (python3.withPackages (ps: with ps; with python3Packages; [

      pandas
      numpy
      matplotlib
    ]))
  ];

  # Automatically run jupyter when entering the shell.
  #shellHook = "jupyter notebook";
}
