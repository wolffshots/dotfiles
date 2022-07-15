function fish_git_dirty
	echo (git status -s --ignore-submodules=dirty 2>/dev/null)
end
