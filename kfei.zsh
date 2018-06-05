#!/bin/zsh

export PATH="${HOME}/bin:${HOME}/script:${PATH}"
export HISTSIZE=1000000

# Daily usages
alias c='clear'
alias ..='cd ..'
alias ....='cd ../..'
alias ......='cd ../../../'
alias mkdir='mkdir -pv'
alias mount='mount | column -t'
alias h='history'
alias j='jobs -l'
alias path='echo -e ${PATH//:/\\n}'
alias cp='rsync -avh --progress'
alias psg='ps -ef | grep -v grep | grep' # e.g. psg firefox
alias \:q='exit'
alias lessf='less +F' # less in following mode (like tail -f)
alias backup='rsync -avvuP --delete'
alias shownet='netstat -nat | grep tcp'
alias ports='netstat -tulanp'
alias netuse='lsof -P -i -n'
alias lb='lsblk -o name,label,size,fstype,model'
alias vimo='vim -O'

# Helpers
alias myip='curl https://ifconfig.co'
alias wwwhere='sudo python -m SimpleHTTPServer ' # e.g. wwwhere 8888
alias vncsrv='x11vnc -nopw -display :0.0 -noremote -xinerama -clip xinerama0 -viewonly -forever -shared'

if (( $+commands[iptables] )) ; then
	# Shortcut for iptables and pass it via sudo
	alias ipt='sudo /sbin/iptables'
	 
	# Display all rules
	alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
	alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
	alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
	alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
	alias firewall=iptlist
fi

if (( $+commands[free] )) ; then
	alias free='/usr/bin/free -m -l -t'
fi

if (( $+commands[docker] )) ; then
	alias dkis='docker images'
	alias dkps='docker ps'
	alias dkcrm="docker ps -a | grep Exited | awk '{print \$1}' | xargs docker rm"

	alias docker="sudo docker"
	alias dklog="docker logs -f"
	alias dkre="docker restart -t 0"
	alias dkcrm='docker rm -v $(docker ps -qf "status=exited")'
	alias dkirm="docker images | grep \<none\> | awk '{print \$3}' | xargs docker rmi"
	function dkt() {
		local run="run -it --rm"
		local mntpwd="-v '$PWD:$PWD' -w '$PWD'"
		if (($#)) ; then
			eval docker ${run} ${mntpwd} "$@"
		else
			eval docker ${run} ${mntpwd} ubuntu:16.04
		fi
	}
fi

if (( $+commands[tmux] )) ; then
	alias tma='tmux -2 attach-session -t'
	alias tmn='tmux -2 new-session -s'
fi

# ls
lsopt="-F"
if [[ "$(uname)" == "FreeBSD" ]] || [[ "$(uname)" == "Darwin" ]] ; then
	lsopt="${lsopt} -GF"
	alias df='df -h'
else
	lshelp="$(ls --help)"
	lsopt="${lsopt} --color=auto"
	[ "$(grep -- "--show-control-chars" <<<"${lshelp}")" ] && \
		lsopt="${lsopt} --show-control-chars"
	[ "$(grep -- "--group-directories-first" <<<"${lshelp}")" ] && \
		lsopt="${lsopt} --group-directories-first"
	alias df='df -T -h -x supermount'
fi
alias l="ls ${lsopt}"
alias la='l -a'
alias l1='l -1'
alias ll='l -l'
alias lla='l -la'
alias lsd='l -d */'
unset lshelp lsopt
