{
  description = "Technion Institute of Technology thesis compilation Nix files";

  # To make user overrides of the nixpkgs flake not take effect
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self
  , nixpkgs
  }: let
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      overlays = [
      ];
      config = {
        allowUnfree = true;
      };
    };
    texlive = pkgs.texliveFull;
  in {
    devShell.x86_64-linux = pkgs.mkShell {
      nativeBuildInputs = [
        texlive
        pkgs.texlivePackages.latexmk
      ];
    };
  };
}
