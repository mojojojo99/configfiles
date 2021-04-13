# af-magic.zsh-theme
# Repo: https://github.com/andyfleming/oh-my-zsh
# Direct Link: https://github.com/andyfleming/oh-my-zsh/blob/master/themes/af-magic.zsh-theme
local user='%{$fg[magenta]%}%n@%{$fg[magenta]%}%m%{$reset_color%}'
local pwd='%{$fg[blue]%}%~%{$reset_color%}'
local return_code='%(?..%{$fg[red]%}%? ↵%{$reset_color%})'
local git_branch='$(git_prompt_status)%{$reset_color%}$(git_prompt_info)%{$reset_color%}'

# settings
typeset +H return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
typeset +H my_gray="$FG[241]"
typeset +H my_orange="$FG[214]"

# separator dashes size
function afmagic_dashes {
	local PYTHON_ENV="$VIRTUAL_ENV"
	[[ -z "$PYTHON_ENV" ]] && PYTHON_ENV="$CONDA_DEFAULT_ENV"

	if [[ -n "$PYTHON_ENV" && "$PS1" = \(* ]]; then
		echo $(( COLUMNS - ${#PYTHON_ENV} - 3 ))
	else
		echo $COLUMNS
	fi
}

# git settings
ZSH_THEME_RVM_PROMPT_OPTIONS="i v g"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$FG[010]%} "
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$FG[012]%}  "
ZSH_THEME_GIT_PROMPT_DELETED="%{$FG[009]%} "
ZSH_THEME_GIT_PROMPT_RENAMED="%{$FG[013]%} ➜ "
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$FG[011]%} ═ "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$FG[008]%}  "

# hg settings
ZSH_THEME_HG_PROMPT_PREFIX="$FG[075]($FG[078]"
ZSH_THEME_HG_PROMPT_CLEAN=""
ZSH_THEME_HG_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_HG_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"

# virtualenv settings
ZSH_THEME_VIRTUALENV_PREFIX=" $FG[075]["
ZSH_THEME_VIRTUALENV_SUFFIX="]%{$reset_color%}"

# primary prompt
PS1='$FG[241]${(l.$(afmagic_dashes)..-.)}%{$reset_color%}
 $FG[004]%~ $FG[013]%(!.#.»)%{$reset_color%} '

# right prompt
(( $+functions[virtualenv_prompt_info] )) && RPS1+='$(virtualenv_prompt_info)'
RPROMPT="${return_code} ${git_branch} \$(ruby_prompt_info)"
RPROMPT+=' $my_gray%n@%m%{$reset_color%}%'
