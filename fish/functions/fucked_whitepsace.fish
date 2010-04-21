function fix_whitespace
  for $i in $argv
    sed -i '' -e 's/  /  /g' -e 's/^M^M/^M/g' $i
  end

end
