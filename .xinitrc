cd ~
xrdb -merge ~/.Xresources

autocutsel -fork
autocutsel -selection PRIMARY -fork
autocutsel -selection CLIPBOARD -fork

xmonad  & PID=$!
#i3  & PID=$!

terminator --command tmux &

wait $PID
