warnings=0
errors=0

echo "Running tests for a front end structure";

# Execute at the right level (should not happen when going through make though)
if [[ ! -e "Makefile" ]]; then
  echo -e "\e[0;31mERROR:   \e[0mYou should execute the tests at the level of your Makefile\e[0m";
  exit;
fi

# Check if folder has got a proper name
if [[ $PWD =~ front-end ]]; then
  echo -e "\e[0;33mWARNING: \e[0mYour project folder should be renamed (currently called 'front-end')\e[0m";
  ((warnings++));
fi

# Check if a git repo has been initiated
if [[ ! $(git rev-parse --is-inside-work-tree 2>/dev/null) ]]; then
  echo -e "\e[0;33mWARNING: \e[0mYou need to initiate a git repository\e[0m";
  ((warnings++));
else
  # Check if git repo at right level
  if [[ $(git rev-parse --show-toplevel) != $PWD ]]; then
    echo -e "\e[0;31mERROR:   \e[0mYour git repository should directly contain the front-end files
         at its root level (currently they are in a subfolder)\e[0m";
    ((errors++));
  fi
fi

if [[ $(cat requirements.txt) =~ "\ntensor" ]]; then
  echo -e "\e[0;31mERROR:   \e[0mYour front end should not use tensorflow\e[0m";
  ((errors++));
fi

if [[ $(cat requirements.txt) =~ "\nscikit" ]]; then
  echo -e "\e[0;31mERROR:   \e[0mYour front end should not use scikit-learn\e[0m";
  ((errors++));
fi


echo -e "Found \e[0;31m${errors} errors\e[0m and \e[0;33m${warnings} warnings\e[0m. Please solve these.\e[0m";
