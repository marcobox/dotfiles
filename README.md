dotfiles.git
============
Clone and run this on a new EC2 instance running Ubuntu 12.04.2 LTS to
configure your `bash` , tmux and `vim` development environment as follows:

```sh
cd $HOME
git clone https://github.com/startup-class/dotfiles.git
lnDot .screenrc .
lnDot .bash_profile .
lnDot .bashrc .
lnDot .bashrc_custom .
lnDot .emacs.d .
```

See also http://github.com/startup-class/setup to install prerequisite
programs.
