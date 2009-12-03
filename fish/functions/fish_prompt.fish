function fish_prompt --description 'Write out the prompt'
	set -l pr_prompt (test $status -eq 0; and gecho '\001\033[32m\002:) ⚡\001\033[0m\002'; or gecho '\001\033[31m\002:( ⚡\001\033[0m\002')
	set -l duration $CMD_DURATION
	set -l pr_duration (test -n "$duration"; and gecho "-> $duration\n")
	set -l pr_term (test $TERM = 'screen'; and gecho "[screen/$WINDOW] ")
	set -l pr_cwd (prompt_pwd)
	set -l pr_git_info (git_cwd_info)
	gecho -e "\001\033[90m\002$pr_duration$pr_term\001\033[0m\002$pr_cwd\001\033[90m\002$pr_git_info\001\033[0m\002\n$pr_prompt "

end
