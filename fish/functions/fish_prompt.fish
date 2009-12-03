function fish_prompt --description 'Write out the prompt'

  set -l previous_status $status #save this for later

  # make colours easy to reference
  set -l Black         '\001\033[0;30m\002'
  set -l Blue          '\001\033[0;34m\002'
  set -l Green         '\001\033[0;32m\002'
  set -l Cyan          '\001\033[0;36m\002'
  set -l Red           '\001\033[0;31m\002'
  set -l Purple        '\001\033[0;35m\002'
  set -l Brown         '\001\033[0;33m\002'
  set -l LightGray     '\001\033[0;37m\002'
  set -l DarkGray      '\001\033[1;30m\002'
  set -l LightBlue     '\001\033[1;34m\002'
  set -l LightGreen    '\001\033[1;32m\002'
  set -l LightCyan     '\001\033[1;36m\002'
  set -l LightRed      '\001\033[1;31m\002'
  set -l LightPurple   '\001\033[1;35m\002'
  set -l Yellow        '\001\033[1;33m\002'
  set -l White         '\001\033[1;37m\002'

	set -l duration $CMD_DURATION
	set -l pr_duration (test -n "$duration"; and gecho "-> $duration\n")
	set -l pr_term (test $TERM = 'screen'; and gecho "[screen/$WINDOW] ")
	set -l pr_cwd (prompt_pwd | sed 's/^\/V\/D\/U\/lparry/\~/;s/^\/V\/D\/U\/l/\~/')
	set -l status_pwd (test $previous_status -eq 0; and gecho "$Green:) $pr_cwd$White"; or gecho "$Red:( $pr_cwd$White")
	set -l pr_git_info (git_cwd_info)
	gecho -e "$LightGrey$pr_duration$pr_term$LightGreen$status_pwd$Yellow$pr_git_info$White\n$LightCyan⚡$White "
end
