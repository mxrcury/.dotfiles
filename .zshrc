# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="eastwood"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
ZSH_DISABLE_COMPFIX=trueexport PATH="/opt/homebrew/opt/llvm/bin:$PATH"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#6d6d6d,bold"

bindkey '`' autosuggest-accept
source /Users/dhonch/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /Users/dhonch/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="/usr/local/opt/postgresql@15/bin:$PATH"

quitkitty ()
{
  killall -q kitty
}

waitfor ()
{
  sleep 3 
}

change_kitty_config_to_pixel ()
{
  mv ~/.config/kitty/kitty.conf ~/.config/kitty/default.conf
  mv ~/.config/kitty/monocraft.conf ~/.config/kitty/kitty.conf
}

change_kitty_config_to_default ()
{
  mv ~/.config/kitty/kitty.conf ~/.config/kitty/monocraft.conf
  mv ~/.config/kitty/default.conf ~/.config/kitty/kitty.conf
}

change_nvim_colorscheme_to_melange ()
{
  local is_already_set=$(cat ~/.config/nvim/lua/mercury/core/colorscheme.lua | grep "SetColor("melange")") || ""
  if [[ "$is_already_set" != "" ]]; then
    return
  fi

  mv ~/.config/nvim/lua/mercury/core/colorscheme.lua ~/.config/nvim/lua/mercury/core/colorscheme.default.lua
  mv ~/.config/nvim/lua/mercury/core/colorscheme.melange.lua ~/.config/nvim/lua/mercury/core/colorscheme.lua
}

change_nvim_colorscheme_to_default ()
{
  local is_already_set=$(cat ~/.config/nvim/lua/mercury/core/colorscheme.lua | grep "SetColor("rose-pine")") || ""
  if [[ "$is_already_set" != "" ]]; then
    return
  fi

  mv ~/.config/nvim/lua/mercury/core/colorscheme.lua ~/.config/nvim/lua/mercury/core/colorscheme.melange.lua
  mv ~/.config/nvim/lua/mercury/core/colorscheme.default.lua ~/.config/nvim/lua/mercury/core/colorscheme.lua}

switchterminalprofile ()
{
  select profile in "melangepixel" "default"
  do
  if [[ "$profile" == "melangepixel" ]]; then
    local is_already_set=$(cat ~/.config/kitty/kitty.conf | grep "Monocraft") || ""
    if [[ "$is_already_set" != "" ]]; then
      echo "MelangePixel is already set"
      return
    fi

    echo "Switching to melange colorscheme with Monocraft font..."
    waitfor
    change_kitty_config_to_pixel
    KITTY_PROFILE="$1"
    change_nvim_colorscheme_to_melange
    quitkitty
  fi
  if [[ "$profile" == "default" ]]; then
    local is_already_set=$(cat ~/.config/kitty/kitty.conf | grep "FiraCode") || ""
    if [[ "$is_already_set" != "" ]]; then
      echo "Default config is already set"
      return
    fi 

    echo "Switching to default config..."
    waitfor
    change_kitty_config_to_default
    change_nvim_colorscheme_to_default
    KITTY_PROFILE="$1"
    quitkitty
  fi
done
}

cwall ()
{
  ls ~/wallpapers
  nvim ~/.config/kitty/kitty.conf
}

cpf ()
{
incoming_file="$1"

outer_file="$2"

if [[ "$outer_file" == "" ]]; then
  outer_file="out.txt"
fi

if [[ "$(ls | grep "$outer_file")" != "" ]]; then
  rm "$outer_file"
fi

cat "$incoming_file" > "$outer_file" && open "$outer_file"
}
