# The bashrc directory in this repo is for scripts that are normally run in the ~/.bashrc file

Quick install steps

	mkdir -p ~/repos/mcunningham
	cd ~/repos/mcunningham
	git clone https://github.com/michaelcunningham/mcunningham.git .
	source ./bashrc/bashrc_login

    # unzip some files that are zipped
    ./app/unzipit.sh

To use these files add this line to the .bashrc file

	echo "source ~/repos/mcunningham/bashrc/bashrc_login" >> ~/.bashrc

If using sqlplus from this repo - add the following to the .bashrc file

	echo >> ~/.bashrc
	echo 'export ORACLE_HOME=~/repos/mcunningham/app/product/12.1.0/client_1' >> ~/.bashrc
	echo 'export LD_LIBRARY_PATH=$ORACLE_HOME' >> ~/.bashrc
	echo 'export PATH=$ORACLE_HOME:$PATH' >> ~/.bashrc

    You will also need a tnsnames.ora file
    mkdir -p ~/repos/mcunningham/app/product/12.1.0/client_1/network/admin

May also need to run this on new servers

	git remote set-url origin https://michaelcunningham@github.com/michaelcunningham/mcunningham.git
	git config user.name michaelcunningham
	git config user.email napacunningham@gmail.com

NOTE: On some servers I have had to copy the .bash_profile

	cp ~/.bash_profile ~/.profile

NOTE: I also like to add this to keep the text from vi visible after exiting vi

	echo "set t_ti= t_te=" > ~/.vimrc

NOTE: On some linux installations when "set -o vi" is used it will remove the tab-complete

      Create the ~/.inputrc file to compensate for that 
      echo "\"\C-i\": complete" > ~/.inputrc

