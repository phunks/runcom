autoload -U compinit
compinit

bindkey -e
setopt share_history
setopt auto_cd
setopt hist_ignore_space
setopt print_eight_bit

PROMPT='%m:%c%# '
HISTFILE=~/.zsh-history
HISTSIZE=10000
SAVEHIST=10000000

# google go
export GOROOT=~/go
export GOOS=darwin
export GOARCH=386
export GOBIN=~/go/bin

# sublime text 2
#export EDITOR='subl -w'

# Java
test -r /sw/bin/init.sh && . /sw/bin/init.sh
JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
CLASSPATH="/System/Library/Frameworks/JavaVM.framework/Classes/rt.jar"
CLASSPATH="$CLASSPATH:/System/Library/Frameworks/JavaVM.framework/Classes/classes.jar:/System/Library/Frameworks/JavaVM.framework/Classes/ui.jar:/System/Library/Frameworks/JavaVM.framework/Home/lib/ext/comm.jar:/System/Library/Java/Extensions/QTJava.zip:/System/Library/Java/Extensions/MRJToolkit.jar"

CLASSPATH="$CLASSPATH:~/Jigsaw/classes/jigsaw.jar:~/Jigsaw/classes/sax.jar:~/Jigsaw/classes/xp.jar:~/Jigsaw/classes/servlet.jar:~/Jigsaw/classes/jigadmin.jar"
CLASSPATH="$CLASSPATH:/Applications/eclipse/plugins/org.apache.ant_1.7.1.v20090120-1145/lib/*"

# Mono
PKG_CONFIG_PATH=/Library/Frameworks/Mono.framework/Versions/2.10.5/lib/pkgconfig

# python2.7
LC_CTYPE=en_US.UTF-8
# python3.3
#export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
#export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
#export WORKON_HOME=~/.virtualenvs
#source /usr/local/bin/virtualenvwrapper.sh


export MANPATH="$MANPATH:/usr/local/share/man:~/man"
export JAVA_HOME CLASSPATH
export LANG="ja_JP.UTF-8"
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig
export XMODIFIERS='@im=kinput2'
export DISPLAY="localhost:0"
export LESSCHARSET=utf-8
export LC_CTYPE="ja_JP.UTF-8"
export LC_ALL="ja_JP.UTF-8"

#colorize the Terminal
#export GREP_OPTIONS=’–color=auto’
#export CLICOLOR=1;

export PATH=/Library/PostgreSQL/9.0/bin:~/bin/:$PATH
export ARCHFLAGS='-arch x86_64'

# NVIDIA CUDA
#export DYLD_LIBRARY_PATH=/usr/local/cuda/lib:$DYLD_LIBRARY_PATH
export PATH=/usr/local/cuda/bin:/Users/pnk/.gem/ruby/1.8/bin:~/go/bin:$PATH 

alias sm="open -a smultron"
#alias jnethack="/usr/games/jnethack | nkf -u -w"
alias pear="/usr/local/bin/pear"
alias emerge='sudo emerge'
alias ls=" ls -FCav"
alias mpg123='find /Volumes/UNI/iTunes/iTunes\ Music/ -name "*.mp3" | mpg123 -z --list -'
#alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
alias emacs="emacs -nw"
#alias wget="wget -l 2 -rk"
alias screen="screen -R"
alias h="history"
alias nmap=" sudo nmap -v -g 53 -sS -p0 -PS"
#alias w3m="w3m-m17n"
#alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin
alias ldd="otool -L"

alias java='java -Dfile.encoding=UTF-8'
alias javac='javac -J-Dfile.encoding=utf-8'
#export _JAVA_OPTIONS=-Duser.language=en
export '_JAVA_OPTIONS=-Duser.language=UTF-8'



if [ "$TERM" = "screen" ]; then
        chpwd () { echo -n "_`dirs`\\" }
        preexec() {
                # see [zsh-workers:13180]
                # http://www.zsh.org/mla/workers/2000/msg03993.html
                emulate -L zsh
                local -a cmd; cmd=(${(z)2})
                case $cmd[1] in
                        fg)
                                if (( $#cmd == 1 )); then
                                        cmd=(builtin jobs -l %+)
                                else
                                        cmd=(builtin jobs -l $cmd[2])
                                fi
                                ;;
                         %*)
                                cmd=(builtin jobs -l $cmd[1])
                                ;;
                         cd)
                                if (( $#cmd == 2)); then
                                        cmd[1]=$cmd[2]
                                fi
                                ;&
                         *)
                                echo -n "k$cmd[1]:t\\"
                                return
                                ;;
                esac

                local -A jt; jt=(${(kv)jobtexts})

                $cmd >>(read num rest
                        cmd=(${(z)${(e):-\$jt$num}})
                        echo -n "k$cmd[1]:t\\") 2>/dev/null
        }
        chpwd
fi

zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''
