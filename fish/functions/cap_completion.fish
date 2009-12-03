function cap_completion
  set -l completion_path $HOME/.completion-cache(pwd)
  set -l cap_cache_file $completion_path/cap_completion
  
  if test -f $cap_cache_file
    set -l cap_options (cat $cap_cache_file)
  else
    echo "Generating capistrano completions..."
    set -l cap_options (cap -T|sed 's/Some tasks.*//;s/or because.*//;s/tasks, type.*//;s/Extended help.*//;s/Type \`cap -e taskname.*//'| cut -f 2 -d ' '|uniq)
    mkdir -p $completion_path

    echo $cap_options > $cap_cache_file
  end
  complete -c cap -a "$cap_options"
  
end