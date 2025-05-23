if status is-interactive
    atuin init fish | source
    zoxide init fish | source
    set -gx EDITOR "nvim"
end
set PATH /home/jj/.local/bin $PATH

function nvm_use_on_dir --on-variable PWD
    if status is-interactive
        if test -e ./.nvmrc
            nvm use
        else
            nvm -s use system
        end
    end
end

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

alias lazynvim='NVIM_APPNAME="lazynvim" nvim'
alias n="nvim	"
if test -e ./.nvmrc
    nvm use
end

# pnpm
set -gx PNPM_HOME "/home/jj/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

pyenv init - fish | source

set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
direnv hook fish | source
