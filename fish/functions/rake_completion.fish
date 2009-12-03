function rake_completion
  set -l completion_path $HOME/.completion-cache(pwd)
  set -l rake_cache_file $completion_path/rake_completion
  
  if test -f $rake_cache_file
    set -l rake_options (cat $rake_cache_file)
  else
    echo "Generating rake completions..."
    set -l rake_options (rake -T| sed 's/(in[^)]*)//'| cut -f 2 -d ' '|uniq)
    mkdir -p $completion_path

    echo $rake_options > $rake_cache_file
  end
  complete -c rake -a "$rake_options"
  
end