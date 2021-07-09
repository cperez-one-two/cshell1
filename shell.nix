#{ pkgs ? import <nixpkgs> {  } }:

let
  sources = import ./sources.nix;
  pkgs = import sources.nixpkgs {};
  customGhc = pkgs.haskell.packages.ghc865.ghcWithPackages (p: [
    p.process
    p.random
  ]);
in pkgs.mkShell
{ name = "cshell1";
  buildInputs = with pkgs; [
    figlet
    hello
    customGhc
    cowsay
    neovim
  ];
  PORT = 2500;

  shellHook = ''
    echo "hello, nix department?"
  '';
}
