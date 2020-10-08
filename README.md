# The bashrc directory in this repo is for scripts that are normally run in the ~/.bashrc file

Quick install steps
	mkdir -p ~/repos/mcunningham
	cd ~/repos/mcunningham
	git clone https://github.com/michaelcunningham/mcunningham.git .
	source ./bashrc/bashrc_login

To use these files add this line to the .bashrc file

	source <repo_dir>/bashrc/bashrc_login
	source ~/repos/mcunningham/bashrc/bashrc_login

	echo "source ~/repos/mcunningham/bashrc/bashrc_login" >> ~/.bashrc

May also need to run this on new servers

	git remote set-url origin https://michaelcunningham@github.com/michaelcunningham/mcunningham.git
	git config --global user.name michaelcunningham
	git config --global user.email napacunningham@gmail.com
