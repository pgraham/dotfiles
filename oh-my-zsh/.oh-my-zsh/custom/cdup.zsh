#!/bin/zsh
# Usage: cdup [DIRNAME]
# Author: Weston Ruter (@westonruter) <http://weston.ruter.net/>
# URL: https://github.com/westonruter/misc-cli-tools/blob/master/cdup
# See also: https://github.com/westonruter/misc-cli-tools/blob/master/cddown
#
# Bash shortcut function to cd you to ancestor directory named as first argument.
# If DIRNAME is not supplied, then .. is used.
# Stop having to cd ../../../..
# Also supports substring matches for ancestor directory names.
# Use `cd -` to undo, to restore old working directory.
# Use aliases for common directories, like: alias docroot="cdup docroot".
# Provide a '...' alias to this for great justice.
# Add function to your ~/.profile
# @todo Add bash tab completion
#
# Example:
# $ pwd
# > /var/www/html/example.com/docroot/long/path/to/something
# $ cdup html
# $ pwd
# > /var/www/html
# $ cd -
# $ pwd
# > /var/www/html/example.com/docroot/long/path/to/something
# $ cdup example
# $ pwd
# > /var/www/html/example.com

function cdup {

  # TODO: Allow an integer parameter to define the number of levels to jump up; allow it to be used with a named arg

  if [[ $# -eq 0 ]]; then
    cd ..
    return 0
  fi

  local target="$1"
  local old=`pwd`

  #IFS='/' read -r -a parts <<< "$target"
  local parts=( ${target//\// } )

  local dir=${parts[1]}
  if [ ${#parts[@]} -gt 1 ]; then
    local sibling=("${parts[@]:1}")
  fi

  if [[ $dir =~ ^-?[0-9]+$  ]]; then
    for (( c=0; c<$dir; c++ )); do
      cd ..
    done
    return 0
  fi

  # Try matching the full segment in path name
  local new=`perl -pe "s{(.*/\Q$dir\E)(?=/|$).*?$}{\1};" <<< $old`

  # If failed, try partial match of segment
  if [[ "$old" == "$new" ]]; then
    old=`dirname $old`
    new=`perl -pe "s{(.*/[^/]*?\Q$dir\E[^/]*?)(?=/|$).*?$}{\1}" <<< $old`
  fi

  # No replacements done, so we failed
  if [[ "$old" == "$new" ]]; then
    echo "Can't find '$dir' among ancestor directories ($old == $new)." 1>&2
    return 1
  fi

  cd $new

  if [[ ! -z "$sibling" ]]; then
    local sib_path=$(IFS=/; echo "${sibling[*]}")
    cd "$sib_path"
  fi
}
