function gpo
  if test (pwd) = '~/dev/marketplace'
    command git push origin $argv #; and marketplace-ci update
  else
    command git push origin $argv
  end
end
