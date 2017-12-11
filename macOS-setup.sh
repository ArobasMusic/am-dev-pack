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
