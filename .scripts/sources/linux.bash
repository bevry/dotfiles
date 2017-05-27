#!/usr/bin/env bash

# Installers
function fontinstall {
	# Prepare
	set -e
	local f="$HOME/.fonts"
	local ft="$f/tmp"
	local p; p=$(pwd)
	mkdir -p "$f" "$ft"
	cd "$ft"

	# Monoid
	down https://cdn.rawgit.com/larsenwork/monoid/2db2d289f4e61010dd3f44e09918d9bb32fb96fd/Monoid.zip
	unzip Monoid.zip
	mv ./*.ttf "$f"

	# Source Code Pro
	# http://askubuntu.com/a/193073/22776
	# https://github.com/adobe-fonts/source-code-pro
	down https://github.com/adobe-fonts/source-code-pro/archive/2.010R-ro/1.030R-it.zip
	unzip 1.030R-it.zip
	mv source-code-pro-2.010R-ro-1.030R-it/OTF/*.otf "$f"

	# Monaco
	# https://github.com/showcases/fonts
	# https://github.com/todylu/monaco.ttf
	down https://github.com/todylu/monaco.ttf/raw/master/monaco.ttf
	mv monaco.ttf "$f"

	# Refresh
	fc-cache -f -v
	cd "$p"
	rm -Rf "$ft"
}

# Bash Autocompletion
if is_bash; then
	if is_file /etc/bash_completion; then
		# shellcheck disable=SC1091
		source /etc/bash_completion
	fi
fi