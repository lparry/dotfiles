function fish_prompt --description 'Write out the prompt'

  set -l previous_status $status #save this for later
#
#  # make colours easy to reference
#  set -l Black         '\001\033[0;30m\002'
#  set -l Blue          '\001\033[0;34m\002'
#  set -l Green         '\001\033[0;32m\002'
#  set -l Cyan          '\001\033[0;36m\002'
#  set -l Red           '\001\033[0;31m\002'
#  set -l Purple        '\001\033[0;35m\002'
#  set -l Brown         '\001\033[0;33m\002'
#  set -l LightGray     '\001\033[0;37m\002'
#  set -l DarkGray      '\001\033[1;30m\002'
#  set -l LightBlue     '\001\033[1;34m\002'
#  set -l LightGreen    '\001\033[1;32m\002'
#  set -l LightCyan     '\001\033[1;36m\002'
#  set -l LightRed      '\001\033[1;31m\002'
#  set -l LightPurple   '\001\033[1;35m\002'
#  set -l Yellow        '\001\033[1;33m\002'
#  set -l White         '\001\033[1;37m\002'
#
  set -l time (date '+%T')
  set -l duration $CMD_DURATION
  set -l pr_duration (test -n "$duration"; and echo "-> $duration")
#  set -l pr_term (test $TERM = 'screen'; and echo "[screen/$WINDOW] ")
  set -l pr_cwd (prompt_pwd | sed 's/^\/V\/D\/U\/lparry/\~/;s/^\/V\/D\/U\/l/\~/')
  set -l pr_git_info (git_cwd_info)
  set -l status_smilie (test $previous_status -eq 0; and echo ":)"; or echo ":(")
  set -l status_color (test $previous_status -eq 0; and echo "green"; or echo "red")

#replacing gecho with native printf call to see if prompt fucks up less this way
#  gecho -e "\n$LightGrey$pr_duration$pr_term$LightGreen$status_pwd$Yellow$pr_git_info$White $time\n$LightCyan⚡$White "
#:) ~/d/m/spec 1682-attachment-redesign@d65fa20 16:12:14
#⚡ 

  printf '%s\n%s%s %s%s%s%s %s\n%s⚡ %s' $pr_duration (set_color $status_color) $status_smilie (set_color blue) $pr_cwd (set_color yellow) $pr_git_info (set_color normal) $time (set_color $status_color) (set_color normal)

end


