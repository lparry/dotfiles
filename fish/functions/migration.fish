function migration
  set migration_file (script/generate migration $argv | tail -n1 | sed -e 's/create//' -e 's/ *//g')
  vim $migration_file
end
