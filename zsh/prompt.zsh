#project_pwd() {
#  echo $PWD | sed -e "s/\/Users\/$USER/~/" -e "s/~\/projects\/\([^\/]*\)\/current/\\1 :/"
#}

#export PROMPT=$'%{\e[0;%(?.32.31)m%}⚡%{\e[0m%} '
#export RPROMPT=$'`project_pwd``git_cwd_info`'

