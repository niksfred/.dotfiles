#!/bin/sh

set -eu

# Windows WezTerm must read a local Windows file during startup; loading the
# config through \\wsl.localhost can block startup before WSL is available.
case "$(uname -r)" in
	*[Mm]icrosoft*) ;;
	*) exit 0 ;;
esac

source_config="$HOME/.wezterm.lua"
windows_config="/mnt/c/Users/nuke-pc/.wezterm.lua"

if [ ! -f "$source_config" ] || [ ! -d "$(dirname "$windows_config")" ]; then
	printf '%s\n' "Skipping Windows WezTerm config sync: source or Windows profile is unavailable" >&2
	exit 0
fi

if ! cmp -s "$source_config" "$windows_config"; then
	cp "$source_config" "$windows_config"
	printf '%s\n' "Updated Windows WezTerm config: $windows_config"
fi
