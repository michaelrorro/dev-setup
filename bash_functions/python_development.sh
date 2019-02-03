
setup_dev () {
  # get the present working directory for the repository
  repo=${PWD##*/}
  printf "Setting up python development environment for $repo...\n\n" # user message

  # virtualenv is running deactivate it
  if [[ "$VIRTUAL_ENV" != "" ]]; then
    deactivate $VIRTUAL_ENV &> /dev/null
  fi

  # virtualenv does not exist, create a new one
  if [ ! -d "$WORKON_HOME/$repo" ]; then
    printf "...Creating virual environment, installing ipython and setting kernel for $repo...\n"
    mkvirtualenv -p python3.6 $repo &> /dev/null
    pip install ipykernel &> /dev/null
    python -m ipykernel install --user --name $repo &> /dev/null

  else
    # Ask if you would like to replace the current virtualenv
    echo -n "There is already a virtualenv for $repo, would you like to replace it? (y/n)?   "
    read answer
    echo ""
    if [ "$answer" != "${answer#[Yy]}" ]; then
      printf "...Removing virtualenv...\n"
      rmvirtualenv $WORKON_HOME/$rep &> /dev/null

      printf "...Creating virual environment, installing ipython kernel and setting kernal for $repo...\n"
      mkvirtualenv -p python3.6 $repo &> /dev/null
      pip install ipykernel &> /dev/null
      python -m ipykernel install --user --name $repo &> /dev/null
    fi
  fi

  # if setup.py exists then run and install all packages
  if [ -f "setup.py" ]; then
    printf "...pip installing from the current setup.py file...\n"
    pip install -e .
  else
    printf "There is no setup.py file to pip install.  Skipping Installation...\n\n"
  fi

  # Make a secrets directory if one does not exist
  secrets="$HOME/secrets"
  if [ ! -d secrets ]; then
    printf "...Creating a secrets directory in $HOME...\n"
    mkdir -p "$HOME/secrets"
  fi

  # declare an array of file folder names and secret files
  declare -a secret_envs=("dev" "prod" "stage")
  declare -a secret_files=("secrets.sh" "env_vars")

  # loop through array of folder names to create the blank secrets files
  printf "...Adding directory and secrets files for $repo into $i $secrets directory...\n"
  for i in "${secret_envs[@]}"
  do
    # folder does not exist
    if [ ! -d "$secrets/$i/$repo" ]; then
      mkdir -p "$secrets/$i/$repo"
    fi

    # folder exists, but files do not
    for j in "${secret_files[@]}"
    do
      if [ ! -f "$secrets/$i/$repo/$j" ]; then
        touch "$secrets/$i/$repo/$j"
      fi
    done
  done

  printf "\nSetup is complete.\n"
}
