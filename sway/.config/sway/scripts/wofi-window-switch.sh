#!/bin/sh

# https://github.com/argosatcore/Deb_Dots/blob/7d58a00b88113a1225c3b5d9114509c66944469c/.local/bin/window_selector.sh
# ------Get available windows:
windows=$(swaymsg -t get_tree | jq -r '
    recurse(.nodes[]?) |
        recurse(.floating_nodes[]?) |
        select(.type=="con"), select(.type=="floating_con") |
            (.id | tostring) + " " + .app_id + ": " + .name')

# ------Limit wofi's height with the number of opened windows:
height=$(echo "$windows" | wc -l)

# ------Select window with wofi:
selected=$(echo "$windows" | wofi -d -i --lines "$height" -p "Switch to:" | awk '{print $1}')

# ------Tell sway to focus said window:
swaymsg [con_id="$selected"] focus
