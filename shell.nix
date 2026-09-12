{ pkgs ? import <nixpkgs> { } }: pkgs.mkShell {
  name = "ciapek";

  packages = with pkgs; [
    nvc gtkwave just
  ];
}
