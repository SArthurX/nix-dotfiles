{ config, pkgs, lib, ... }:

{
  home.stateVersion = "23.11";

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  home.packages = with pkgs; [
   #vscode-fhs
	 #neovim
	  alacritty
	  zellij
	  tigervnc
    


    btop
    neofetch
    cmatrix
    cbonsai
    bat
    ffmpeg

    curl
    wget
    zip
    unzip
    fzf
    jq
    tldr

    #arduino-ide

    discord
    spotify

  ] ++ lib.optionals stdenv.isDarwin [
    	cocoapods
    	m-cli
    ];

  nixpkgs.overlays = [
    (self: super: {
      libsepol = super.libsepol.overrideAttrs (oldAttrs: {
        preConfigure = ''
        '';
      });
    })
  ];

  
  programs.home-manager.enable = true;
  programs.zsh.enable = true;
  programs.neovim.enable = true;
  programs.autojump.enable = true;
  programs.bat.enable = true;
  programs.fzf.enable = true;  
  programs.alacritty.enable = true;
  

  programs.alacritty = {
    settings = {
      window.opacity = 0.5;

      font = {
        normal = {
          family = "MesloLGS NF";
          style = "Regular";
        };
      };
    };
  };


  programs.zsh = {
    enableAutosuggestions = true;
    enableCompletion = true;
    # enablesyntax-highlighting
	  autocd = true;
    
    initExtra = 
    ''
      export PATH="$HOME/development/flutter/bin:$PATH"
      export PATH="$HOME/.cargo/bin:$PATH"
      export PATH="$HOME/.rustup/toolchains/stable-aarch64-apple-darwin/bin:$PATH"
    '';

    plugins = [
	  {
		  name = "powerlevel10k";
		  src = pkgs.zsh-powerlevel10k;
		  file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }
    {
		  name = "powerlevel10k-config";
		  src = ./zsh/p10k-config;
		  file = ".p10k.zsh";
    }
    {
      name = "zsh-vscode";
      src = ./zsh/plugins/zsh-vscode;
      file = "zsh-vscode.plugin.zsh";
    }
    ];
    
	  oh-my-zsh = {
		  enable = false;
		  theme = "darkblood";
	  };

    shellAliases = {
      vi="nvim";
      vim="nvim";
      
      py="python";
	    
      cserver="ssh sx@172.26.50.233";
      
      ys="yabai -m query --windows";

	    darwin-re="darwin-rebuild switch --flake ~/.config/nix-darwin";
    };

    historySubstringSearch = {
      enable = true;
      searchUpKey = [
        "^[[A"
	    ];
    };
  };

  programs.neovim = {
    defaultEditor = true;

		
    #plugins = with.pkgs.vimPlugins;[

		#];
#    extraConfig =
#      ''
#        set number relativenumber
#        set list
#        set listchars=tab:\|\ ,trail:·
#        set listchars+=precedes:«,extends:»
#        set listchars+=nbsp:␣
#        set wrap
#        set tabstop=2
#        set shiftwidth=2
#	set expandtab
#        set colorcolumn=81
#	set clipboard=unnamed
#      '';
  };

  programs.bat = {
    config = {
      theme = "OneHalfDark";
	  };
  };
}
