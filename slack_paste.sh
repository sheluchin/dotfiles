#!/bin/sh
printf "\`\`\`\n$(xclip -selection clipboard -o) \n\`\`\`" | xclip -selection clipboard
sleep 0.4
xdotool key ctrl+v
xdotool key Return
