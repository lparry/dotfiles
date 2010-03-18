function fish_prompt --description 'Write out the prompt'

  set -l previous_status $status #save this for later

  set -l time (date '+%T')
  set -l duration $CMD_DURATION
  set -l pr_duration (test -n "$duration"; and echo "-> $duration"; or echo "")
#  set -l pr_term (test $TERM = 'screen'; and echo "[screen/$WINDOW] ")
  set -l pr_cwd (prompt_pwd | sed 's/^\/V\/D\/U\/lparry/\~/;s/^\/V\/D\/U\/l/\~/')
  set -l pr_git_info (git_parse_branch)
  set -l status_smilie (test $previous_status -eq 0; and echo ":)"; or echo ":(")
  set -l status_color (test $previous_status -eq 0; and echo "green"; or echo "red")

  test -n "$pr_git_info";and true; or set -l pr_git_info ''

  printf '%s\n%s%s %s%s %s[%s] %s%s\n%s⚡ %s' $pr_duration (set_color $status_color) $status_smilie (set_color blue) $pr_cwd (set_color yellow) $pr_git_info (set_color normal) $time (set_color $status_color) (set_color normal)

end
