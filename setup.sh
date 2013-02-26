#!/bin/bash
# Should work on both MacOS and Ubuntu

# Check for .profile vs .bash_profile
if [[ ! -s "$HOME/.bash_profile" && -s "$HOME/.profile" ]] ; then
	profile_file="$HOME/.profile"
else
	profile_file="$HOME/.bash_profile"
fi

# Setup PS1 to keep things short and sweet
if ! grep -q 'export PS1' "${profile_file}"; then
	echo "Editing ${profile_file} to fix shell prompt"
	echo "export PS1='\W$(__git_ps1 "(%s)") $ '" >> "${profile_file}"
fi

# Setup git-completion.bash to show current commit
if ! grep -q 'git-completion.bash' "${profile_file}" ; then
	echo "Editing ${profile_file} to load ~/.git-completion.bash and ~/.git-prompt.sh on Terminal launch"
	echo "source \"$HOME/.git-completion.bash\"" >> "${profile_file}"
	echo "source \"$HOME/.git-prompt.sh\"" >> "${profile_file}"
fi

