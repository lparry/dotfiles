function g
  if test $argv[1]
    echo "this doesnt do that anymore, stupid!"
  else
    command git status
    true
  end
end
