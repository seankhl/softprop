# for convenient opening and terminal quieting

alias op="xdg-open >/dev/null 2>&1"
alias qq=">/dev/null 2>&1"

alias cp='cp -i'
alias rm='rm -I'

twitch() {
    if [ "$#" -eq 1 ]; then
        livestreamer -p mpv http://www.twitch.tv/$1 source &
    elif [ "$#" -eq 2 ]; then
        livestreamer -p mpv http://www.twitch.tv/$1 $2 &
    else
        echo "twitch [stream] [quality]"
    fi
}

