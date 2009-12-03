function fish_prompt --description 'Write out the prompt'
  set -l GREEN '\001\033[32m\002'
  set -l WHITE '\001\033[0m\002'
  set -l RED   '\001\033[31m\002'
  set -l GREY '\001\033[90m\002'

	set -l pr_prompt (test $status -eq 0; and gecho "$GREEN:)$WHITE ⚡"; or gecho "$RED:($WHITE ⚡")
	set -l duration $CMD_DURATION
	set -l pr_duration (test -n "$duration"; and gecho "-> $duration\n")
	set -l pr_term (test $TERM = 'screen'; and gecho "[screen/$WINDOW] ")
	set -l pr_cwd (prompt_pwd)
	set -l pr_git_info (git_cwd_info)
	gecho -e "$GREY$pr_duration$pr_term$WHITE$pr_cwd$GREY$pr_git_info$WHITE\n$pr_prompt "
end
