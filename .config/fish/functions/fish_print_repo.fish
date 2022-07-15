function fish_print_repo
                if fish_git_repo
                        set -l dirty (fish_git_dirty)
			function fish_print_repo_vars
				printf '%s'(fish_git_branch)
	                        printf "$argv[1]"
			end
                        if test -n "$dirty"
				set_color yellow
				fish_print_repo_vars "" "✗"
			else				
				set_color -d green
				fish_print_repo_vars ""
                        end			
			set_color normal
                end
end
