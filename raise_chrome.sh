# https://askubuntu.com/a/200935
if ps aux | grep "chrome" > /dev/null
 then xdotool windowactivate $(xdotool search --onlyvisible --name "Google Chrome")
 else google-chrome&
fi

