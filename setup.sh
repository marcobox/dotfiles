DOTFILEDIR="dotfiles/"

function lnDot {
	[[ -n "${1}" ]] || return
	if [[ "${1:0:1}" = "." ]];then
		SOURCEFILE="${DOTFILEDIR}/${1:1}"
	else
		SOURCEFILE="${DOTFILEDIR}/${1}"
	fi
	if [[ -L "${1}" ]]; then
		ln -sf "${SOURCEFILE}" "${2}"
	elif [[ -f "${1}" ]]; then
		ln -sb "${SOURCEFILE}" "${2}"
	elif [[ -d "${1}/" ]]; then
		mv "${1}" "${1}~"
		ln -sf "${SOURCEFILE}" "${2}"
	else
		ln -s "${SOURCEFILE}" "${2}"
	fi
}


# git pull and install dotfiles as well
cd "$HOME"
if [[ -d "./${DOTFILEDIR}/" ]]; then
    mv dotfiles dotfiles.old
fi

git --git-dir="${DOTFILEDIR}/.git" remote rm origin
git --git-dir="${DOTFILEDIR}/.git" remote add origin git@github.com:marcobox/dotfiles.git
git --git-dir="${DOTFILEDIR}/.git" remote add upstream https://github.com/startup-class/dotfiles.git
lnDot .screenrc
lnDot .bash_profile
lnDot .bashrc
lnDot .bashrc_custom
lnDot .tmux.conf
lnDot .tmux.conf.debug
lnDot .vimrc
lnDot .vim
lnDot .tmux
lnDot .emacs.d
lnDot .ssh
lnDot .terminfo
lnDot .gitconfig
lnDot .jshintrc
lnDot bin

