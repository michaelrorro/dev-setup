# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null
brew install caskroom/cask/brew-cask 2> /dev/null

# install spectical app
brew cask install spectacle

# install atom
brew cask install atom
apm install atom-shell-commands
apm install hydrogen
apm install file-icons
apm install pretty-json
apm install teletype
apm install autocomplete-python
apm install python-autopep8
apm install emmitt

# install visual studio code
brew cask install visual-studio-code
