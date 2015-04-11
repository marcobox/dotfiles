DOTFILEDIR="dotfiles"

function lnDot {
	[[ -n "${1}" ]] || return
	DEST="${2:-$1}"
	if [[ "${1:0:1}" = "." ]];then
		SOURCEFILE="${DOTFILEDIR}/${1:1}"
	else
		SOURCEFILE="${DOTFILEDIR}/${1}"
	fi
	if [[ -L "${DEST}" ]]; then
		ln -sfn "${SOURCEFILE}" "${DEST}"
	elif [[ -f "${DEST}" ]]; then
		ln -sb "${SOURCEFILE}" "${DEST}"
	elif [[ -d "${DEST}/" ]]; then
		mv "${DEST}" "${DEST}~"
		ln -sf "${SOURCEFILE}" "${DEST}"
	else
		ln -s "${SOURCEFILE}" "${DEST}"
	fi
}


cd "$HOME"

git --git-dir="${DOTFILEDIR}/.git" remote rm origin
git --git-dir="${DOTFILEDIR}/.git" remote add origin git@github.com:marcobox/dotfiles.git
git --git-dir="${DOTFILEDIR}/.git" remote add upstream https://github.com/startup-class/dotfiles.git
lnDot .screenrc
lnDot .bash_profile
lnDot .bashrc
lnDot .bashrc_custom
lnDot .bash_env
lnDot .tmux.conf
lnDot .tmux.conf.debug
lnDot .vimrc
lnDot .vim
lnDot .tmux
lnDot .emacs.d
lnDot .ssh/config
lnDot .terminfo
lnDot .gitconfig
lnDot .jshintrc
lnDot bin

