# Check if working directory is windows or linux
function isWinDir {
  case $PWD/ in
    /mnt/*) return $(true);;
    *) return $(false);;
  esac
}

# Wrap the git command to either run windows git or linux
function git {
  if isWinDir
  then
    git.exe "$@"
  else
    /usr/bin/git "$@"
  fi
}
