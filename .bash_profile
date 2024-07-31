echo "Hello $USER"

export COURSE_ID="_REPO_NAME_"

if !  [ -f "$HOME/.token" ]; then
	if ! find "$HOME/.token" -perm 600 -print | grep -q .; then
		echo "Warning: .token file has too open permissions"
	fi
fi

umask 002

USER_COMMANDS_DIR="$HOME/usercommands"
export PATH="$PATH:$USER_COMMANDS_DIR"

date -u +"%Y-%m-%dT %H:%M:%S %z"

alias ltxt='ls *.txt'

[ -d "$HOME/tmp" ] && rm -rf "$HOME/tmp/*" || mkdir "$HOME/tmp"

netstat -tuln | grep ':8080' | awk '{print $9}' | xargs -r kill