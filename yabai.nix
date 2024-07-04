{ ... }: {
  services.yabai = {
    enable = true;
    enableScriptingAddition = true;
    config = {
      layout = "bsp";
      window_placement = "second_child";
      focus_follows_mouse = "autoraise";
      auto_balance = "off";

      mouse_modifier = "alt";
      mouse_action1 = "move";
      mouse_action2 = "resize";

      # gaps
      top_padding = 55;
      bottom_padding = 15;
      left_padding = 15;
      right_padding = 15;
      window_gap = 10;
    };
    extraConfig = 
      ''
      yabai -m signal --add event=window_focused   action="sketchybar --trigger window_focus"
      yabai -m signal --add event=window_created   action="sketchybar --trigger windows_on_spaces"
      yabai -m signal --add event=window_destroyed action="sketchybar --trigger windows_on_spaces"


      # rules
      yabai -m rule --add app="^System Settings$"    manage=off
      yabai -m rule --add app="^System Information$" manage=off
      yabai -m rule --add app="^System Preferences$" manage=off

      yabai -m rule --add title="Preferences$"       manage=off
      yabai -m rule --add title="Settings"           manage=off
      yabai -m rule --add title="Riot Client"        manage=off
     #yabai -m rule --add title="Discord"            manage=off
      yabai -m rule --add title="LINE"               manage=off
      yabai -m rule --add title="sketchybar"         manage=off


      #yabai -m rule --add label='mouse_focus_top' app='.*' title='.*' layer=above 
    '';
  };
}
