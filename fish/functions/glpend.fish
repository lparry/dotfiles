function glpend
  printf "commits from %s%s/%s%s to %sHEAD%s" (set_color red) (command git config branch.(git_parse_branch).remote) (git_parse_branch) (set_color normal) (set_color red) (set_color normal)
  echo
  command git --no-pager log --graph (command git config branch.(git_parse_branch).remote)/(git_parse_branch)..HEAD $git_concise_log_format
  echo


end
