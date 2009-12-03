function clear_completion_caches
  rm -rf $home/.completion_cache
  #trigger regeneration if in a rails app 
  cd . 
end
