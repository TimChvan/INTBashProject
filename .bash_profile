echo "Hello $USER"

export COURSE_ID="__REPO_NAME__"

if [ -f "$HOME/.token" ]; then
    if [ "$(stat -c %a "$HOME/.token")" -ne 600 ]; then
        echo "Warning: .token file has too open permissions"
    fi
fi


umask 006

USER_COMMANDS_DIR="$HOME/usercommands"
export PATH="$PATH:$USER_COMMANDS_DIR"

date -u +"%Y-%m-%dT%H:%M:%S %z"

alias ltxt='ls *.txt'

if [ -d "~/tmp" ]; then
    rm -rf "~/tmp/*"
else
    mkdir "tmp"
fi

netstat -tuln | awk '/:8080/{print $9}' | xargs -r kill || true