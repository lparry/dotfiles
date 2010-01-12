function g
	if test $argv[1]
		git $argv
	else
		git status
		true
	end


end
