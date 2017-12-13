#! /usr/bin/env bash

if [ -x "/usr/local/bin/brew" ];
then
    # Update  Homebrew
    brew update
    brew upgrade
else
    # install Homebrew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# CMake, Git, Python
brew install cmake
brew install git
brew install python3

# Conan installation
pip3 install conan conan_package_tools --upgrade

# Install editor
TMPDIR=$(mktemp -d)
EDITOR_ZIP="$TMPDIR/editor.zip"
CODE="https://go.microsoft.com/fwlink/?LinkID=620882"
ATOM="https://atom.io/download/mac"

while true;
do
    echo "Which editor do you want to install?"
    echo "1. Atom"
    echo "2. VS Code"
    echo "3. neither"
    read -p "> "
    case $REPLY in
        1)
            EDITOR="$ATOM"; break
            ;;
        2)
            EDITOR="$CODE"; break
            ;;
        3)
            EDITOR=none; break
            ;;
    esac
done

if [ $EDITOR != none ];
then    
    curl -o "$EDITOR_ZIP" -L "$EDITOR"
    if groups | grep -q admin;
    then
        pushd "/Applications"
    else
        pushd "$HOME/Applications"
    fi
    unzip -x "$EDITOR_ZIP"
    popd
fi

rm -fr "$TMPDIR"
