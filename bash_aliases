alias sul='su -l'

alias ll='ls -alhF --color=always | grep "^d" &&
          ls -alhF --color=always | grep "^-" &&
          ls -alhF | grep "^total"'

alias lll='ls -lhF --color=always | grep "^d" &&
           ls -lhF --color=always | grep "^-"
           ls -lhF | grep "^total"'
