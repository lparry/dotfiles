function git_dirty
  set -l differences (command git diff --stat)
  test -n "$differences"
end
