{ ... }: {
  services.sketchybar = {
    enable = true;
    config =
    ''
source $HOME/.config/nix-darwin/sketchybar/colors.sh
source $HOME/.config/nix-darwin/sketchybar/icons.sh

PLUGIN_DIR="$HOME/.config/nix-darwin/sketchybar/plugins"
ITEM_DIR="$HOME/.config/nix-darwin/sketchybar/items"


############## BAR ##############
sketchybar --bar height=42 \
                 y_offset=5 \
                 blur_radius=0 \
                 position=top \
                 padding_left=2 \
                 padding_right=4 \
                 margin=10 \
                 corner_radius=12 \
                 color=0x801e1d2e \
                 shadow=off \
                #topmost=true

############## GLOBAL DEFAULTS ##############
sketchybar --default updates=when_shown \
                     icon.font="MesloLGS NF:Bold:16.0" \
                     icon.color=0xffECEFF4 \
                     icon.highlight_color=0x40E48FA8 \
                     label.font="MesloLGS NF:Bold:16.0" \
                     label.color=0xffECEFF4 \
                     background.corner_radius=5 \
                     background.height=30 \
                     icon.padding_left=4 \
                     icon.padding_right=4

source $ITEM_DIR/left/apple.sh

source $ITEM_DIR/left/spaces.sh

############## ITEM DEFAULTS ###############

source $ITEM_DIR/center/spotify.sh


############## RIGHT ITEMS ##############

source $ITEM_DIR/right/time.sh
source $ITEM_DIR/right/date.sh
source $ITEM_DIR/right/net.sh
source $ITEM_DIR/right/battery.sh
#source $ITEM_DIR/right/cpu.sh
#source $ITEM_DIR/right/darkside.sh
    '';
  };
}
