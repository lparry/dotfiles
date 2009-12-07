function cd --description 'Change directory'
  if status --is-command-substitution
    builtin cd $argv[1]
    return $status
  else
    if test -z $argv[1]
      echo "empty"
      cd $HOME
    else
      if test $argv[1] = '-'
        if test -z $OLDPWD
          echo "No previous working directory."
          return 1
        else
          echo "last"
          cd $OLDPWD
        end
      else
        if test $argv[1] = $PWD
          return 0
        else
          echo "changing to $argv[1]"
          set -g OLDPWD $PWD
          builtin cd $argv[1]
          set -l cd_status $status
          # if test -f 'Rakefile'
          #   rake_completion
          # end
          # if test -f 'Capfile'
          #   cap_completion
          # end
          if test $cd_status = 0
            ls
          end
          return $cd_status
        end
      end
    end
  end
end
