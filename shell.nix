{pkgs ? import <nixpkgs> {}}:
pkgs.callPackage (
  {mkShell}:
    mkShell {
      buildInputs = with pkgs; [
        neovim
        ripgrep
        git
        gh
        dotter
      ];
    }
) {}
