# Helper functions for package management
function whatprovides() {
    dnf whatprovides "*/$1"
}

function search-pkg() {
    dnf repoquery -l "*$1*"
}

# Help system
(( ${+aliases[run-help]} )) && unalias run-help
autoload -Uz run-help


###############################################################################
# Cursor
###############################################################################
cursor() {
	nohup /usr/local/bin/cursor "$@" --no-sandbox &> /dev/null &!
}

###############################################################################
# Git
###############################################################################
glog() {
	setterm -linewrap off

	git --no-pager log --all --color=always --graph --abbrev-commit --decorate \
	--format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' | \
		sed -E \
		-e 's/\|(\x1b\[[0-9;]*m)+\\(\x1b\[[0-9;]*m)+ /├\1─╮\2/' \
		-e 's/(\x1b\[[0-9;]+m)\|\x1b\[m\1\/\x1b\[m /\1├─╯\x1b\[m/' \
		-e 's/\|(\x1b\[[0-9;]*m)+\\(\x1b\[[0-9;]*m)+/├\1╮\2/' \
		-e 's/(\x1b\[[0-9;]+m)\|\x1b\[m\1\/\x1b\[m/\1├╯\x1b\[m/' \
		-e 's/╮(\x1b\[[0-9;]*m)+\\/╮\1╰╮/' \
		-e 's/╯(\x1b\[[0-9;]*m)+\//╯\1╭╯/' \
		-e 's/(\||\\)\x1b\[m   (\x1b\[[0-9;]*m)/╰╮\2/' \
		-e 's/(\x1b\[[0-9;]*m)\\/\1╮/g' \
		-e 's/(\x1b\[[0-9;]*m)\//\1╯/g' \
		-e 's/^\*|(\x1b\[m )\*/\1⎬/g' \
		-e 's/(\x1b\[[0-9;]*m)\|/\1│/g' \
		| command less -r +'/[^/]HEAD'

	setterm -linewrap on
}

###############################################################################
# Open dolphin with the current folder
###############################################################################
open() {
  folder=$1
  if [[ -z "$1" ]]; then
    folder="."
  fi

  nohup dolphin $folder &> /dev/null &!
}


###############################################################################
# Start rubymine
###############################################################################
# rmine() {
#   folder=$1
#   if [[ -z "$1" ]]; then
#     folder="."
#   fi
#   nohup rubymine $folder > /dev/null 2>&1 &
# }

###############################################################################
# I'm not sure what this does
###############################################################################
# if [[ $TILIX_ID ]]; then
#   source /etc/profile.d/vte.sh
# fi
