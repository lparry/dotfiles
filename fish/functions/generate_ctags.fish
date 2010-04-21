function generate_ctags
  ctags -R --exclude=.git --exclude=log --exclude=database_backup.sql *
end
