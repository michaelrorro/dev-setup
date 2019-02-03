# read in shortcuts
for file in ~/bash_functions; do source file; done

# python
export PATH=":$HOME/anaconda3/bin:$PATH"
export PATH=":$HOME/anaconda3/bin/virtualenv:$PATH"
export VIRTUALENVWRAPPER_PYTHON="$HOME/anaconda3/bin/python"
export VIRTUALENVWRAPPER_VIRTUALENV="$HOME/anaconda3/bin/virtualenv"
source "$HOME/anaconda3/bin/virtualenvwrapper.sh"

# java
export JAVA_HOME="/usr/libexec/java_home -v 1.8"
export LD_LIBRARY_PATH=$JAVA_HOME/jre/lib/server

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# - - - - - - - - - -
#      SSL Stuff
# - - - - - - - - - -

# # Only For OSX (Darwin)
# if [[ "$OSTYPE" == "darwin"* ]]; then
#   if ssh-add -L | grep -q 'The agent has no identities.'; then
#       echo "Reading ssh-key to keychain."
#       ssh-add -K
#   fi
# fi


# - - - - - - - - - -
#   Proxy Functions
# - - - - - - - - - -
