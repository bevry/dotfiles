#!/usr/bin/env fish

# Don't check mail
export MAILCHECK=0

# Paths
source "$HOME/.scripts/sources/var.fish"
var_add PATH "$HOME/.scripts/commands"
function paths_init
	eval (paths_commands)
end
paths_init

# Fisherman
if test -d "$HOME/.config/fisherman"; else
	echo "setting up fisherman..."
	curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
	fisher bass nvm
	echo "...fisherman setup"
end

# Editor
eval (editor_commands)
function edit
	if is_ssh
		eval "$TERMINAL_EDITOR" $argv
	else
		eval "$GUI_EDITOR" $argv
	end
end

# Extras
source "$HOME/.scripts/sources/aliases.sh"
if is_mac
	source "$HOME/.scripts/sources/mac.sh"
else if is_linux
	source "$HOME/.scripts/sources/linux.sh"
end
if is_file "$HOME/.scripts/env.sh"
	source "$HOME/.scripts/env.sh"
end

# Theme
if is_equal "$THEME" "baltheme"
	function fish_prompt
		~/.scripts/themes/baltheme fish
	end
end

# SSH Keys silently
silent addsshkeys
