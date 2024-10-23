# -----------------------------
# General
# -----------------------------
# 色を使用
autoload -Uz colors ; colors

# エディタをvimに設定
export EDITOR=vim

# パスを追加したい場合
export PATH="$HOME/bin:$PATH"

# cdした際のディレクトリをディレクトリスタックへ自動追加
# setopt auto_pushd

# ディレクトリスタックへの追加の際に重複させない
# setopt pushd_ignore_dups

# emacsキーバインド
bindkey -e

# viキーバインド
#bindkey -v

# フローコントロールを無効にする
setopt no_flow_control

# ワイルドカード展開を使用する
setopt extended_glob

# 自動でpushdを実行
setopt auto_pushd

# pushdから重複を削除
setopt pushd_ignore_dups

# カッコの対応などを自動的に補完する
setopt auto_param_keys

# bgプロセスの状態変化を即時に知らせる
setopt notify

# 8bit文字を有効にする
setopt print_eight_bit

# 終了ステータスが0以外の場合にステータスを表示する
setopt print_exit_value

# ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt mark_dirs

# コマンドのスペルチェックをする
setopt correct

# コマンドライン全てのスペルチェックをする
setopt correct_all

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# パスの最後のスラッシュを削除しない
setopt noautoremoveslash

# 各コマンドが実行されるときにパスをハッシュに入れる
# setopt hash_cmds

# rsysncでsshを使用する
export RSYNC_RSH=ssh

# その他
umask 022
ulimit -c 0


# -----------------------------
# Completion
# -----------------------------
# 自動補完を有効にする
autoload -Uz compinit ; compinit

# 単語の入力途中でもTab補完を有効化
#setopt complete_in_word

# コマンドミスを修正
setopt correct

# 補完の選択を楽にする
zstyle ':completion:*' menu select

# 補完候補をできるだけ詰めて表示する
setopt list_packed

# 補完候補にファイルの種類も表示する
#setopt list_types

# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad

# 補完時の色設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# キャッシュの利用による補完の高速化
zstyle ':completion::complete:*' use-cache true

# 補完候補に色つける
autoload -U colors ; colors ; zstyle ':completion:*' list-colors "${LS_COLORS}"
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# 大文字・小文字を区別しない(大文字を入力した場合は区別する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# manの補完をセクション番号別に表示させる
zstyle ':completion:*:manuals' separate-sections true

# --prefix=/usr などの = 以降でも補完
setopt magic_equal_subst

# -----------------------------
# History
# -----------------------------
# 基本設定
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000

# ヒストリーに重複を表示しない
setopt histignorealldups

# 他のターミナルとヒストリーを共有
setopt share_history

# すでにhistoryにあるコマンドは残さない
setopt hist_ignore_all_dups

# historyに日付を表示
alias h='fc -lt '%F %T' 1'

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 履歴をすぐに追加する
setopt inc_append_history

# ヒストリを呼び出してから実行する間に一旦編集できる状態になる
setopt hist_verify

#余分なスペースを削除してヒストリに記録する
#setopt hist_reduce_blanks

# historyコマンドは残さない
#setopt hist_save_no_dups

# -----------------------------
# Alias
# -----------------------------
# グローバルエイリアス
alias -g L='| less'
alias -g H='| head'
alias -g G='| grep'
alias -g GI='| grep -ri'

# エイリアス
alias lst='ls -ltr --color=auto'
alias ls='ls --color=auto'
alias la='ls -la --color=auto'
alias ll='ls -l --color=auto'

alias du="du -Th"
alias df="df -Th"
alias su="su -l"
alias so='source'
alias vi='vim'
alias vz='vim ~/.zshrc'
# alias c='cdr'
alias cp='cp -i'
alias rm='rm -i'
alias mkdir='mkdir -p'
# alias ..='c ../'
alias back='pushd'
alias diff='diff -U1'

alias tma='tmux attach'
alias tml='tmux list-window'

alias dki="docker run -i -t -P"
alias dex="docker exec -i -t"
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
alias dcp='docker compose'

# git
alias gp='git push origin head'
alias gpl='git pull origin head'
alias gsw='git switch'

alias g='clang++ -std=c++17'
alias a='./a.out'

# docker-compose
alias up='docker-compose up'
alias down='docker-compose down'
alias e='docker-compose exec'
alias ee='docker-compose exec nginx bash'
alias pn="pnpm"

# -----------------------------
# Plugin
# -----------------------------
# zplugが無ければインストール
if [[ ! -d ~/.zplug ]];then
  git clone https://github.com/zplug/zplug ~/.zplug
fi

# zplugを有効化する
source ~/.zplug/init.zsh

# プラグインList
# zplug "ユーザー名/リポジトリ名", タグ
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# インストールしていないプラグインをインストール
# if ! zplug check --verbose; then
#   printf "Install? [y/N]: "
#   if read -q; then
#       echo; zplug install
#   fi
# fi

# コマンドをリンクして、PATH に追加し、プラグインは読み込む
zplug load --verbose

# -----------------------------
# PATH
# -----------------------------
case "${OSTYPE}" in
  darwin*)
    export PATH=/opt/local/bin:/opt/local/sbin:$PATH
    export MANPATH=/opt/local/share/man:/opt/local/man:$MANPATH
  ;;
esac

# Setting PATH for Python 3.8
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi



# NOTE: run only first time
# brew install zsh-syntax-highlighting
# POWERLEVEL10K_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$POWERLEVEL10K_DIR"
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh

plugins=(git)

# source $HOME/dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

func show()
{
  git diff --name-only `git branch | awk 'NR==2 {print $2}'` | sort
}

func restart()
{
  docker-compose down && docker-compose up
}

# screen recording to gif
# togif YOUR_VIDEO.mov
togif ()
{
  ffmpeg -i $1 -r 24 $1.gif
}

togif-high-quority ()
{
  local input_file="$1"
  local base_name=$(basename "$input_file" | rev | cut -d. -f2- | rev)
  local output_file="${base_name}.gif"

  ffmpeg -i "$input_file" -filter_complex "[0:v] split [a][b];[a] palettegen=stats_mode=diff:reserve_transparent=0 [p];[b][p] paletteuse=dither=none:diff_mode=rectangle" "$output_file"
}

function t()
{
  tmux new-session -s $(pwd |sed -E 's!^.+/([^/]+/[^/]+)$!\1!g' | sed -e 's/\./-/g')
}

function psgrep() {
  ps aux | grep -v grep | grep "USER.*COMMAND"
  ps aux | grep -v grep | grep $1
}

function dstop()
{
  docker stop $(docker ps -a -q);
}

function drm()
{
  docker rm $(docker ps -a -q);
}

