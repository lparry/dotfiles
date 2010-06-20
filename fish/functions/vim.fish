function vim
  if connected_locally
    mvim $argv
  else
    command vim $argv
  end
end
