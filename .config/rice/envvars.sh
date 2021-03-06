#!/bin/sh

EDITOR nvim
TERMINAL st
BROWSER brave

PATH $PATH:$HOME/.scripts
TERM st-256color
#LS_COLORS  $LS_COLORS:ow=1;34:tw=1;34:

# xdg base directory
XDG_DESKTOP_DIR $HOME

XDG_CONFIG_HOME $HOME/.config
XDG_CACHE_HOME $HOME/.cache
XDG_DATA_HOME $HOME/.local/share

XDG_DOCUMENTS_DIR $HOME/dokumente
XDG_DOWNLOAD_DIR $HOME/downloads
XDG_PICTURES_DIR $HOME/bilder
XDG_VIDEOS_DIR $HOME/videos
XDG_MUSIC_DIR $HOME/musik

VSCODE_PORTABLE $XDG_DATA_HOME/vscode
LESSKEY $XDG_CONFIG_HOME/less/lesskey
LESSHISTFILE -
WGETRC $XDG_CONFIG_HOME/wget/wgetrc
WINEPREFIX $XDG_DATA_HOME/wineprefixes/default
ZDOTDIR $XDG_CONFIG_HOME/zsh
HISTFILE $XDG_DATA_HOME/zsh/history
XAUTHORITY $XDG_RUNTIME_DIR/Xauthority
XINITRC $XDG_CONFIG_HOME/X11/xinitrc
DOCKER_CONFIG $XDG_CONFIG_HOME/docker
PSQLRC $XDG_CONFIG_HOME/pg/psqlrc
PSQL_HISTORY $XDG_CACHE_HOME/pg/psql_history
PGPASSFILE $XDG_CONFIG_HOME/pg/pgpass
PGSERVICEFILE $XDG_CONFIG_HOME/pg/pg_service.conf

# ZSH
ZSH $XDG_CONFIG_HOME/zsh/ohmyzsh

HISTFILESIZE 1000000
HISTSIZE 1000000
SAVEHIST $HISTSIZE
HIST_IGNORE_DUPS

#GTK2_RC_FILES $XDG_CONFIG_HOME/gtk-2.0/gtkrc
#NUGET_PACKAGES $XDG_CACHE_HOME/NuGetPackages
#PASSWORD_STORE_DIR $XDG_DATA_HOME/pass
#VSCODE_PORTABLE $XDG_DATA_HOME/vscode
