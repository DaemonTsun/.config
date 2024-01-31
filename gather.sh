#!/usr/bin/bash

# gather.sh - a script to update configs into or from the git repository
# usage:
#   gather.sh
#   updates all files in the git repository with the up-to-date files on the
#   filesystem


set -e # stop on error
cd "$(dirname "$0")" # change dir to script location

VIMPATH="$HOME/.config/vim"
VIMFILES=(
    "$VIMPATH/vimrc"
    "$VIMPATH/gvimrc"
    "$VIMPATH/filetype.vim"
    "$VIMPATH/syntax/cpp.vim"
    "$VIMPATH/syntax/c.vim"
    "$VIMPATH/plugin/000-vim-addons.vim"
    "$VIMPATH/plugin/AlignMapsPlugin.vim"
    "$VIMPATH/plugin/AlignPlugin.vim"
    "$VIMPATH/plugin/abolish.vim"
    "$VIMPATH/plugin/cecutil.vim"
    "$VIMPATH/plugin/ctags.vim"
    "$VIMPATH/plugin/justify.vim"
    "$VIMPATH/plugin/sessions.vim"
    "$VIMPATH/plugin/source_header_swap.vim"
    "$VIMPATH/colors/summerfruit.vim"
    "$VIMPATH/autoload/Align.vim"
    "$VIMPATH/autoload/AlignMaps.vim"
)

NVIMPATH="$HOME/.config/nvim"
NVIMFILES=(
    "$NVIMPATH/init.vim"
    "$NVIMPATH/ginit.vim"
    "$NVIMPATH/colors/nvim-summerfruit.vim"
)

ZSHRC="$HOME/.zshrc"
ZSHPATH="$HOME/.config/zsh"
ZSHFILES=(
    "$ZSHPATH/completion/_pw"
    "$ZSHPATH/completion/_pw-py"
)

QUITERSSINI="$HOME/.config/QuiteRss/QuiteRss.ini"

function update_file()
{
    FROM="$1"
    TO_BASE="$2"
    TO="$3${FROM#$TO_BASE/}"

    if [ -f "$FROM" ]; then
        echo "  updating $FROM -> $TO"
        cp -u "$FROM" "$TO"
    else
        echo "  skipping missing $FROM"
    fi
}

function update_group()
{
    BASEPATH="$1"
    BASE="$2"
    shift 2
    FILES=("$@")

    if [ -d "$BASEPATH" ]; then
        echo "updating files in $BASEPATH"

        for f in ${FILES[@]}; do
            update_file "$f" "$BASEPATH" "$BASE"
        done
    fi
}

update_group "$VIMPATH" "vim/" "${VIMFILES[@]}"
update_group "$NVIMPATH" "nvim/" "${NVIMFILES[@]}"

update_file "$ZSHRC" "$HOME" ""
update_group "$ZSHPATH" "zsh/" "${ZSHFILES[@]}"
update_file "$QUITERSSINI" "$HOME/.config/QuiteRss" ""

