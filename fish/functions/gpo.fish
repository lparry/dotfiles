function gpo
  command git pull; and if test (pwd) = '~/dev/marketplace'
    command git push origin $argv
    if test $status -eq 0
      marketplace-ci update
    end
  else
    command git push origin $argv
  end
end
