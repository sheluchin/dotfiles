. /etc/skel/.bashrc
. ~/.bash_profile

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
. "$HOME/.cargo/env"

[[ -s "/home/alex/.gvm/scripts/gvm" ]] && source "/home/alex/.gvm/scripts/gvm"

PATH="/home/alex/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/alex/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/alex/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/alex/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/alex/perl5"; export PERL_MM_OPT;

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# opencode
export PATH=/home/alex/.opencode/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"

# home-manager packages win over ~/.local/bin, linuxbrew, etc.
export PATH="$HOME/.nix-profile/bin:$PATH"
