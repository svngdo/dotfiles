set -gx PATH /opt/homebrew/bin $PATH
set -gx PATH $HOME/.bun/bin:$PATH

alias l "lsd --long --human-readable --group-dirs first --gitsort --git --blocks permission,size,date,git,name --date relative --size short --permission octal"
alias lt "lsd --long --human-readable --group-dirs first --gitsort --git --blocks permission,size,date,git,name --date relative --size short --permission octal --tree --depth 2"
alias vim "nvim"
alias cat "bat"
alias grep "rg"

alias gs "git status"
alias gl "git log --oneline --graph --decorate --all"
alias gb "git branch"
alias gba "git branch --all"
alias gf "git fetch"
alias gfp "git fetch --prune"
alias gp "git pull"
alias gco "git checkout"
alias gsw "git switch"
alias gw "git worktree"
alias gwl "git worktree list"
alias gwa "git worktree add"
alias gwm "git worktree move"

# alias va '[ -f .venv/bin/activate ] && source .venv/bin/activate || echo "no venv here"'
# alias vd 'deactivate 2>/dev/null || echo "no venv active"'
function va
    if test -f .venv/bin/activate.fish
        source .venv/bin/activate.fish
    else
        echo "no venv here"
    end
end

function vd
    deactivate 2>/dev/null; or echo "no venv active"
end

starship init fish | source
zoxide init fish | source
