# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=~/.oh-my-zsh
  export VISUAL=nvim
  export EDITOR="$VISUAL"
  export NVIM_SERVER
  export PATH=$PATH':/home/strixx/.gem/ruby/2.4.0/bin'

# Enable Vi Mode


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="geometry/geometry"
# ZSH_THEME="ys"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
#COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(fasd warhol)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
 export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
source $ZSH/alias/zalias_default


### FTP Server Alias ###

#Alphasolutions

#alias ftpconnect-alphasolutions='lftp -u andrea@alphasolutions-al.com alphasolutions-al.com' #Connects to alphasolutions FTP server

#              #Connect to alphasolutions FTP server and download to default folder (~/FTP/)
#alias ftpconnect-alphasolutions-download="lftp -c ' open -u andrea@alphasolutions-al.com alphasolutions-al.com
#                mirror -P5 -c -e -n / /home/strixx/FTP/alphasolutions
#                bye
#              '"
#              #Connect to alphasolutions FTP server and upload from default folder (~/FTP/)
#alias ftpconnect-alphasolutions-upload="lftp -c ' open -u andrea@alphasolutions-al.com alphasolutions-al.com
#                mirror -R -P5 -c -e -n /home/strixx/FTP/alphasolutions /
#                bye
#              '"

#alias ftpconnect-tregumakinave-upload="lftp -c 'open -u server179.web-hosting.com andrea@tregumakinave.al
#mirror -R -P5 -n /home/strixx/Projects/Web-Projects/tregumakinave/understrap /public_html/wp-content/themes/understrap --ignore-time --exclude node_modules/ --exclude .git/
#bye
#'"
##Novelepubs

#alias ftpconnect-novelepubs='lftp -u andrea@novelepubs.com ftp.novelepubs.xyz' #Connects to novelepubs FTP server

#              #Connect to novelepubs FTP server and download to default folder (~/FTP/)
#alias ftpconnect-novelepubs-download="lftp -c ' open -u andrea@novelepubs.com ftp.novelepubs.xyz
#                mirror -P5 --use-cache -c -e -n / /home/strixx/FTP/novelepubs
#                bye
#              '"
#              #Connect to novelepubs FTP server and upload from default folder (~/FTP/)
#alias ftpconnect-novelepubs-upload="lftp -c ' open -u andrea@novelepubs.com ftp.novelepubs.xyz
#                mirror --exclude '.*/' --include 'wp-content/themes/' -R --parallel=5 -c -e -n /home/strixx/FTP/novelepubs /
#                bye
#              '"




#
#####################################################################################################

# FZF Commands

D() {
  local dir
  dir=$(cat ~/.vifm/fzf-read/locate-dir 2> /dev/null | fzf +m) &&
  cd "$dir"
}
F() {
  local file
  local dir
  file=$(cat ~/.vifm/fzf-read/locate-file | fzf +m ) && dir=$(dirname "$file")  && cd $dir && Filex=$(echo $file | awk -F/ '{print $NF}' ) && echo $Filex
}
fh() {
  print -z $( ( [ -n "$ZSH_NAME" ] && fc -1 1 || history ) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# fasd & fzf change directory - jump using `fasd` if given argument, filter output of `fasd` using `fzf` else

# fasd & fzf change directory - jump using `fasd` if given argument, filter output of `fasd` using `fzf` else
d() {
    [ $# -gt 0 ] && fasd_cd -d "$*" && return
    local dir
    dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}

f() {
    [ $# -gt 0 ] && fasd_cd -d "$*" && return
    local dir
    local file
    file="$(fasd -Rfl "$1" | fzf -1 -0 --no-sort +m)" && dir=$(dirname "$file") && cd $dir && Filex=$(echo $file | awk -F/ '{print $NF}' ) && echo $Filex
}


# MPD FZF Scripts
# MPD FTW
# This function will invoke a meny that lets you select What kind of search you wish to do.
# It's an easy shortcut for the other methods, in case you're lazy to type them ;)
m() {
  local list
  list=$(echo 'Any' && echo 'Genre' && echo 'Artist' && echo 'Albums' && echo 'Clear Playlist')
  rm -f fileTypes
  echo $list > fileTypes

  type=$(cat fileTypes | \
    fzf-tmux --query="$1" --reverse --select-1 --exit-0 ) || return 1
  case `echo $type` in
    'Genre') fmg;;
    'Artist') fmaa;;
    'Albums') fma;;
    'Clear Playlist') fmc;;
    *) fms;;
  esac
}

# Function to show the current playlist
fmc() {
  local song_position
  song_position=$(mpc -p 6699  -f "%position%) %time% - %artist% - %title%" playlist | \
    fzf-tmux --query="$1" --reverse --select-1 --exit-0 | \
    sed 's/).*//') || return 1
  [ -n "$song_position" ] && mpc -p 6699 -q play $song_position
}

# Search for any Song
fms() {
  local song
  song=$(mpc -p 6699 search filename "" | \
    fzf-tmux --query="$1" --reverse --select-1 --exit-0) || return 1
  [ -n "$song" ] && mpc -p 6699 insert $song; mpc -p 6699 play; mpc -p 6699 next
}

# Search Genres
fmg() {
  local genre
  genre=$(mpc -p 6699 list genre | \
    fzf-tmux --query="$1" --reverse --select-1 --exit-0) || return 1
  mpc -p 6699 clear;
  [ -n "$genre" ] && mpc -p 6699 search genre $genre | mpc -p 6699 insert; mpc -p 6699 play
}

# Search Artists
fma() {
  local artist
  artist=$(mpc -p 6699 list artist | \
    fzf-tmux --query="$1" --reverse --select-1 --exit-0) || return 1
  mpc -p 6699 clear;
  [ -n "$artist" ] && mpc -p 6699 search artist $artist | mpc -p 6699 insert; mpc -p 6699 play
}


# Clear the playlist and invoke the fm()
fmC() {
  mpc -p 6699 clear
  fm
}
nf() {
  nvim $(cat /home/strixx/.vifm/fzf-read/locate-file | fzf)
}
