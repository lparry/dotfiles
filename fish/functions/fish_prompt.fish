function fish_prompt --description 'Write out the prompt'

  if test $status -eq 0
    set status_color green
    set status_smilie ":)"
  else
    set status_color red
    set status_smilie ":("
  end


  set -l duration $CMD_DURATION

  set -l time (date '+%T')

  # hide the fact I symlink my home directory in the prompt
  set -l pr_cwd (prompt_pwd | sed 's/^\/V\/D\/U\/lparry/\~/;s/^\/V\/D\/U\/l/\~/')

  set -l pr_git_info (git_parse_branch)


  printf '\n'

  if test -n "$duration"
    printf '\->%s\n' $duration
  end
  printf '%s%s '  (set_color $status_color) $status_smilie

  printf '%s%s ' (set_color cyan) $pr_cwd

  if test -n "$pr_git_info"
    if git_dirty
      set git_color yellow --bold --underline --background red
    else
      set git_color green
    end
    printf '%s[%s%s%s] ' (set_color blue) (set_color $git_color) $pr_git_info (set_color blue --background normal)
  end
  printf '%s%s ' (set_color normal) $time
  printf '\n%s⚡%s ' (set_color $status_color) (set_color normal)

end
#  set -l pr_term (test $TERM = 'screen'; and echo "[screen/$WINDOW] ")
