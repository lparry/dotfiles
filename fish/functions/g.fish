function g
#  if test $argv[1]
#    git $argv
#  else
    command git status
    true
#  end
end
