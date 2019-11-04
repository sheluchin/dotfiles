# https://askubuntu.com/a/200935
if ps aux | grep "firefox" > /dev/null
 then xdotool windowactivate $(xdotool search --onlyvisible --name "Firefox")
 else GDK_SCALE=1 firefox
fi

