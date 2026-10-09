[[ -f "$HOME/.secrets" ]] && . "$HOME/.secrets" && echo ".secrets imported"

bash_files=( "settings" "aliases" "functions" "plugins" )

if [[ -d "$HOME/.bash/" ]]; then

    for bash_file in "${bash_files[@]}"; do

        file_path="${HOME}/.bash/${bash_file}";
        [[ -f "$file_path" ]] && . "$file_path"
    done

fi
if [ -e /home/alex/.nix-profile/etc/profile.d/nix.sh ]; then . /home/alex/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export PATH="$HOME/.poetry/bin:$PATH"
. "$HOME/.cargo/env"
