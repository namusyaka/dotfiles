autoload -Uz vcs_info

zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'

function make-default-prompt {
  local heading success failure position vcs

  case ${UID} in
    0)
      heading=$'%{\e[38;5;9m%}local Root%{\e[m%} '
      ;;
    *)
      heading=$'%{\e[38;5;208m%}local%{\e[m%} '
      ;;
  esac

  success=$'%{\e[38;5;99m%}[-_-]%{\e[m%}'
  failure=$'%{\e[38;5;99m%}[-_-%{\e[38;5;200m%}#%{\e[m%}%{\e[38;5;99m%}]%{\e[m%}'

  position=$'%{\e[38;5;110m%}%~%{\e[m%}'

  result="$heading%(?.$success.$failure) : $position "

  if [[ ! "$PWD" =~ '/\.git(/.*)?$' ]]; then
    vcs=$'%{\e[38;5;120m%}%1v%{\e[m%} '
    result="$result$vcs"
  fi
  echo "$result⚡  "
}

function get-chruby-version {
  local _ruby
  if [[ $(chruby | grep -c \*) -eq 1 ]]; then
    _ruby="$(chruby | grep \* | tr -d '* ')"
    echo ${_ruby}
  else
    echo "system"
  fi
}

function make-right-prompt {
  local result
  result="%{\e[38;5;208m%}[`get-chruby-version`]%{\e[m%}"
  echo $result
}

setopt prompt_subst
PROMPT='`make-default-prompt`'
PROMPT2="%{${fg[cyan]}%}%_%%%{${reset_color}%} "
SPROMPT="%{${fg[cyan]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
if [[ -n "${REMOTEHOST}${SSH_CONNECTION}" ]]; then
  PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
fi

precmd() {
  echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
  LANG=en_US.UTF-8 vcs_info
  RPROMPT="`make-right-prompt`"
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
