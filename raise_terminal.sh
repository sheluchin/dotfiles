# https://askubuntu.com/a/200935
# if ps aux | grep "[g]nome-terminal" > /dev/null
if ps aux | grep "kitty" > /dev/null
 then xdotool windowactivate $(xdotool search --onlyvisible --class kitty)
 else kitty&
fi
