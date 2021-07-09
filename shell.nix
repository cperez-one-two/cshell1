{ pkgs ? import <nixpkgs> {  } }:

pkgs.mkShell
{ name = "CShell1";
  buildInputs = with pkgs; [
    figlet
    hello
    # neovim and more for when you're more advanced
  ];

  shellHook = ''
    echo "hello, nix department?"
  '';
}
