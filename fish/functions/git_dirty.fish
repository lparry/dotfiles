function git_dirty
  set -l differences (git diff --stat)
  test -n "$differences"
end
