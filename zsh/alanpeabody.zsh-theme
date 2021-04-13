
local user='%{$fg[magenta]%}%n@%{$fg[magenta]%}%m%{$reset_color%}'
local pwd='%{$fg[blue]%}%~%{$reset_color%}'
local return_code='%(?..%{$fg[red]%}%? ↵%{$reset_color%})'
local git_branch='$(git_prompt_status)%{$reset_color%}$(git_prompt_info)%{$reset_color%}'

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

ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg[green]%}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%{$reset_color%}"

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

PROMPT="${user} ${pwd}$ "
RPROMPT="${return_code} ${git_branch} \$(ruby_prompt_info)"


# primary prompt
PS1='$FG[007]${(l.$(afmagic_dashes)..-.)}%{$reset_color%}
 $fg[magenta]%n%{$reset_color%} %{$fg[blue]%}%~%{$reset_color%} $FG[007] » '
