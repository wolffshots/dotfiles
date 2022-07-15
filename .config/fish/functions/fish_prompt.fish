function fish_prompt
	if test ! -z "$git_functions"
		echo setting up functions
		set -g git_functions 
		fish_prompt_functions
	end
	set_color magenta
	printf '%s'(basename (prompt_hostname))
	set_color normal	
	printf ' > '
	set_color cyan
        printf '%s'(basename (prompt_pwd))
	if fish_git_repo
		set_color -d ccc	
		printf '['
		set_color normal
		printf '%s'(fish_print_repo)
		set_color -d ccc	
		printf ']'
       	end
        set_color normal
	
	printf '%s'(fish_print_prompt_char)
end
