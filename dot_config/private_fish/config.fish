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

alias lazynvim='NVIM_APPNAME="lazynvim" nvim'
