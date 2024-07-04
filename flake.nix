{
  description = "MacOS nix-darwin Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nix-darwin, nixpkgs, home-manager }@inputs:
  let
    configuration = { pkgs, ... }: {
      environment.systemPackages = with pkgs;[
        #vscode-fhs

        python3
        poetry
        rustc
        cargo
        wasm-pack
        nodejs
        
        hexo-cli
        obsidian
        
        vencord

        telegram-desktop
        raycast

        warp-terminal
        
      ];
      
      services.nix-daemon.enable = true;
      
      nix.settings.experimental-features = "nix-command flakes";
      users.users.sx.home = "/Users/sx";
      programs.zsh.enable = true;

      system.configurationRevision = self.rev or self.dirtyRev or null;

      system.stateVersion = 4;

      nixpkgs.config.allowUnsupportedSystem = true;
      security.pam.enableSudoTouchIdAuth = true;
      nixpkgs.config.allowUnfree = true; 
      nixpkgs.config.allowBroken = true;
      nixpkgs.hostPlatform = "aarch64-darwin";
      services.skhd.enable = true;
    };
  in
  {
    darwinConfigurations."chenguanyandeMacBook-Pro" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        configuration
        (import ./yabai.nix)
        (import ./skhd.nix)
        (import ./sketchybar.nix)
        home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.sx = import ./home.nix;
        }
      ];
    };

    darwinPackages = self.darwinConfigurations."chenguanyandeMacBook-Pro".pkgs;
  };
}
