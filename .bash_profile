[[ -f "$HOME/.secrets" ]] && . "$HOME/.secrets" && echo ".secrets imported"

bash_files=( "settings" "aliases" "functions" "plugins" )

if [[ -d "$HOME/.bash/" ]]; then

    for bash_file in "${bash_files[@]}"; do

        file_path="${HOME}/.bash/${bash_file}";
        [[ -f "$file_path" ]] && . "$file_path" && echo "${file_path} imported";
    done

fi

export PATH="$HOME/.poetry/bin:$PATH"
