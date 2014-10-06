#!/bin/bash

# some trivial aliases
alias c='clear'
alias ls='/bin/ls --color=auto'
alias ll='/bin/ls -alh --color=auto'
alias ..='cd ..'
alias ....='cd ../..'
alias ......='cd ../../../'
alias mkdir='mkdir -pv'
alias mount='mount | column -t'
alias h='history'
alias j='jobs -l'
alias path='echo -e ${PATH//:/\\n}'
alias ports='netstat -tulanp'
alias cp='rsync -avh --progress'
alias psg='ps -ef | grep -v grep | grep ' # e.g. psg firefox
alias \:q='exit'

# shortcut  for iptables and pass it via sudo#
alias ipt='sudo /sbin/iptables'
 
# display all rules #
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias firewall=iptlist

# also pass it via sudo so whoever is admin can reload it without calling you #
alias nginxreload='sudo /usr/local/nginx/sbin/nginx -s reload'
alias nginxtest='sudo /usr/local/nginx/sbin/nginx -t'
alias lightyload='sudo /etc/init.d/lighttpd reload'
alias lightytest='sudo /usr/sbin/lighttpd -f /etc/lighttpd/lighttpd.conf -t'
alias httpdreload='sudo /usr/sbin/apachectl -k graceful'
alias httpdtest='sudo /usr/sbin/apachectl -t && /usr/sbin/apachectl -t -D DUMP_VHOSTS'

# pass options to free #
alias free='/usr/bin/free -m -l -t'

# for rdesktop
alias 100='rdesktop -a 16 -g 1280x800 -z -k en-us -T 100 192.168.1.100 -u <username> -p <password> -r clipboard:PRIMARYCLIPBOARD -r sound:off &'
alias 101='rdesktop -a 16 -g 1280x800 -z -k en-us -T 101 192.168.1.101 -u <username> -p <password> -d <domain> -r disk:home=/<share_path> -r clipboard:PRIMARYCLIPBOARD -r sound:off &'

# misc
alias shownet='netstat -nat | grep tcp'
alias wwwhere='sudo python -m SimpleHTTPServer ' # e.g. wwwhere 8888
alias vncsrv='x11vnc -nopw -display :0.0 -noremote -xinerama -clip xinerama0 -viewonly -forever -shared'
alias googledns='sudo sh -c " echo '\''nameserver 8.8.8.8'\'' > /etc/resolv.conf "'
alias html2rsync='rsync -avh --progress --exclude=".*" --include="*.html" --include="*/" --exclude="*"'
