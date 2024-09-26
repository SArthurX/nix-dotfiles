{ pkgs, ... }:

let
  homebrew = pkgs.callPackage pkgs.homebrew {};
in
{
  homebrew = {
    enable = true;
    packages = with homebrew.packages.aarch64-darwin; [
      cool-retro-term
    ];
  };
}

