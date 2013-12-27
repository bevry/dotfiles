###
# Configuration

# Core
export RBENV_ROOT=/usr/local/opt/rbenv
export PATH=$HOME/bin:/usr/local/bin:/usr/local/share/python:$RBENV_ROOT/bin:/usr/local/opt/ruby/bin:/usr/local/heroku/bin:$PATH
export MANPATH=/usr/local/man:$MANPATH
export OS="$(uname -s)"

# Editor
export LC_CTYPE=en_US.UTF-8
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='sublime -w'
fi


###
# Git Configuration

# Configure Git
git config --global core.excludesfile ~/.gitignore_global
git config --global push.default simple
git config --global mergetool.keepBackup false
git config --global color.ui auto
git config --global hub.protocol https
git config core.filemode false

# Use OSX Credential Helper if available, otherwise default to time cache
if [[ "$OS" = "Darwin" ]]; then
	git config --global credential.helper osxkeychain
	git config --global diff.tool opendiff
	git config --global merge.tool opendiff
	git config --global difftool.prompt false
else
	git config --global credential.helper cache
	git config credential.helper 'cache --timeout=86400'
fi


###
# Source

# Source our custom rc configuration
source "$HOME/.userrc.sh"