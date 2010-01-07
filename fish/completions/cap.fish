function __cache_or_get_cap_completion -d "Create cap completions"
  set -l cap_cache_dir "~/tmp/cap_completion_cache"
  mkdir -p "$cap_cache_dir"
  set -l hashed_pwd (md5 -q -s (pwd))
  set -l cap_cache_file "$cap_cache_dir/$hashed_pwd"
  
  if not test -f "$cap_cache_file"
    cap -T 2>&1 | grep "^cap" |cut -d " " -f 2 > "$cap_cache_file"
  end
  
  cat "$cap_cache_file"
end

complete -x -c cap -a "(__cache_or_get_cap_completion)" --description 'Capistrano task'
