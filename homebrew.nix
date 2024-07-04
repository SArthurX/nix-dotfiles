{ pkgs }:
{
  homebrew.enable = true;

  homebrew.installDir = "$HOME/.config/homebrew";

  environment.systemPackages = with pkgs; [
    homebrew
    homebrew.packages.cool-retro-term
  ];
}

