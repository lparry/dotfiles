function fix_whitespace
  for i in $argv
    sed -i '' -e 's/	/  /g' -e 's/ *$//' -e 's/
  end
end