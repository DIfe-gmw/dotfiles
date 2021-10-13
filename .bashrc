# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# neofetch
echo ""
neofetch --ascii_distro artix_small

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

# The following block is surrounded by two delimiters.
# These delimiters must not be modified. Thanks.
PROMPT_ALTERNATIVE=twoline
NEWLINE_BEFORE_PROMPT=yes


if [ "$color_prompt" = yes ]; then
    # override default virtualenv indicator in prompt
    VIRTUAL_ENV_DISABLE_PROMPT=1

    prompt_color='\[\033[;32m\]'
    info_color='\[\033[1;34m\]'
    prompt_symbol=@
    if [ "$EUID" -eq 0 ]; then # Change prompt colors for root user
        prompt_color='\[\033[;94m\]'
        info_color='\[\033[1;31m\]'
        prompt_symbol=💀
    fi
    case "$PROMPT_ALTERNATIVE" in
        twoline)
            PS1=$prompt_color'┌──${arch_chroot:+($arch_chroot)──}${VIRTUAL_ENV:+(\[\033[0;1m\]$(basename $VIRTUAL_ENV)'$prompt_color')}('$info_color'\u${prompt_symbol}\h'$prompt_color')-[\[\033[0;1m\]\w'$prompt_color']\n'$prompt_color'└─'$info_color'\$\[\033[0m\] ';;
        oneline)
            PS1='${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV)) }${arch_chroot:+($arch_chroot)}'$info_color'\u@\h\[\033[00m\]:'$prompt_color'\[\033[01m\]\w\[\033[00m\]\$ ';;
        backtrack)
            PS1='${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV)) }${arch_chroot:+($arch_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ ';;
    esac
else
    PS1='${arch_chroot:+($arch_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt


[ "$NEWLINE_BEFORE_PROMPT" = yes ] && PROMPT_COMMAND="PROMPT_COMMAND=echo"

# enable color support of ls, less and man, and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip --color=auto'

    export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
    export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
    export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
    export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
    export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
    export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
    export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias las='ls -all'
alias s='sudo'
# Additional customization
# Set keyboard to BR
setxkbmap -model abnt2 -layout br -variant abnt2
# Set $PATH env variable
export PATH="$HOME/.config/composer/vendor/bin:$PATH,$HOME/.config/polybar/launch.sh"
# Function that gets arch linux website most recent post and returns it into terminal
function archnews {
    	# Arch latest news
    	if [ "$PS1" ] && [[ $(ping -c1 www.archlinux.org 2>&-) ]]; then
    		# The characters "£, §" are used as metacharacters. They should not be encountered in a feed...
    		echo -e "$(echo $(curl --silent https://archlinux.org/feeds/news/ | awk ' NR == 1 {while ($0 !~ /<\/item>/) {print;getline} sub(/<\/item>.*/,"</item>") ;print}' | sed -e ':a;N;$!ba;s/\n/ /g') | \
    			sed -e 's/&amp;/\&/g
    			s/&lt;\|&#60;/</g
    			s/&gt;\|&#62;/>/g
    			s/<\/a>/£/g
    			s/href\=\"/§/g
    			s/<title>/\\n\\n\\n   :: \\e[01;31m/g; s/<\/title>/\\e[00m ::\\n/g
    			s/<link>/ [ \\e[01;36m/g; s/<\/link>/\\e[00m ]/g
    			s/<description>/\\n\\n\\e[00;37m/g; s/<\/description>/\\e[00m\\n\\n/g
    			s/<p\( [^>]\)\?>\|<br\s\/\?>/\n/g
    			s/<b\( [^>]\)\?>\|<strong\( [^>]\)\?>/\\e[01;30m/g; s/<\/b>\|<\/strong>/\\e[00;37m/g
    			s/<i\( [^>]\)\?>\|<em\( [^>]\)\?>/\\e[41;37m/g; s/<\/i>\|<\/em>/\\e[00;37m/g
    			s/<u\( [^>]*\)\?>/\\e[4;37m/g; s/<\/u>/\\e[00;37m/g
    			s/<code\( [^>]*\)\?>/\\e[00m/g; s/<\/code>/\\e[00;37m/g
    			s/<a[^§|t]§\([^\"]\)\"[^>]>\([^£]\)[^£]*£/\\e[01;31m\2\\e[00;37m \\e[01;34m[\\e[00;37m \\e[04m\1\\e[00;37m\\e[01;34m ]\\e[00;37m/g
    			s/<li\( [^>]\)\?>/\n \\e[01;34m\\e[00;37m /g
    			s/<!\[CDATA\[\|\]\]>//g
    			s/\|>\s*<//g
    			s/ *<[^>]\+> */ /g
    			s/[<>£§]//g')\n\n";
    	else
    		echo "Unable to reach the internet"
    	fi
}
# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
#
# This bashrc was made with the help of Kali linux's source bashrc code.
