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
