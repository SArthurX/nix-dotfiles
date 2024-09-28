{ ... }: {
  services.skhd = {
    enable = true;
    skhdConfig = ''
      alt - return : open -na /nix/store/dar3shhqh608sdd4pnw0b66ca6bq8niq-alacritty-0.13.1/Applications/Alacritty.app

      alt + shift - c : open /Applications/Visual\ Studio\ Code.app
      
      ralt - o : open /Applications/Nix\ Apps/Obsidian.app
      ralt - s : open -na /Applications/Safari.app
      

      # focus window
      alt - h : yabai -m window --focus west
      alt - j : yabai -m window --focus south
      alt - k : yabai -m window --focus north
      alt - l : yabai -m window --focus east


      # swap managed window
      alt + shift - h : yabai -m window --swap west
      alt + shift - j : yabai -m window --swap south
      alt + shift - k : yabai -m window --swap north
      alt + shift - l : yabai -m window --swap east


      alt + shift - w : yabai -m window -- resize top:0:-20
      alt + shift - a : yabai -m window -- resize top:0:-20
      alt + shift - s : yabai -m window -- resize top:0:-20
      alt + shift - d : yabai -m window -- resize top:0:-20

      alt - r : yabai -m space --rotate 270
      alt + shift - r : yabai -m space --rotate 90
      alt + shift - y : yabai -m space --mirror y-axis

      alt - f : yabai -m window --toggle zoom-fullscreen
      alt + shift - f : yabai -m window --toggle native-fullscreen

      alt + shift - t : yabai -m window --toggle float --grid 4:4:1:1:2:2
      alt + shift - g : yabai -m window --toggle float --grid 8:8:6:6:2:2

      alt - 0 : yabai -m space --balance
      alt - 1 : yabai -m space --focus 1
      alt - 2 : yabai -m space --focus 2
      alt - 3 : yabai -m space --focus 3
      alt - 4 : yabai -m space --focus 4
      alt - 5 : yabai -m space --focus 5
      alt - 6 : yabai -m space --focus 6
      alt - 7 : yabai -m space --focus 7
      alt - 8 : yabai -m space --focus 8
      alt - 9 : yabai -m space --focus 9

      alt + shift - 1 : yabai -m window --space 1
      alt + shift - 2 : yabai -m window --space 2
      alt + shift - 3 : yabai -m window --space 3
      alt + shift - 4 : yabai -m window --space 4
      alt + shift - 5 : yabai -m window --space 5
      alt + shift - 6 : yabai -m window --space 6
      alt + shift - 7 : yabai -m window --space 7
      alt + shift - 8 : yabai -m window --space 8
      alt + shift - 9 : yabai -m window --space 9
    '';
  };
}
