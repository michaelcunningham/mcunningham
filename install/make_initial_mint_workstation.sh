# Linux Mint 22 (Wilma) is based off of Ubuntu 24.04 (noble)
# cat /etc/os-release
# /etc/upstream-release/lsb-release
#
# First thing is to add the following line to sudoers file
# Change visudo editor with:
#    sudo update-alternatives --config editor
#
# sudu visudo - and add the following line
# mcunningham ALL=(root) NOPASSWD: ALL

# echo "set t_ti= t_te=" > ~/.vimrc

# sudo umount -a -t vboxsf
# sudo chown mcunningham:mcunningham /mnt/install
# sudo chown mcunningham.mcunningham /mnt/dba
# sudo chown mcunningham:mcunningham /mnt/vmshare

# sudo mount -t vboxsf -o uid=1000,gid=1000 vd_dba /mnt/dba
# sudo mount -t vboxsf -o uid=1000,gid=1000 vd_vmshare /mnt/vmshare
# sudo mount -t vboxsf -o uid=1000,gid=1000 vd_install /mnt/install

# mkdir ~/install
# cd ~/install
# ln -s ~/repos/mcunningham/install/make_initial_mint_workstation.sh ~/install/make_initial_mint_workstation.sh

# cp /mnt/vmshare/virtualbox/.pgpass /home/mcunningham/.pgpass
# chmod 600 /home/mcunningham/.pgpass
# cp /mnt/vmshare/virtualbox/.bashrc_new_mint_machine /home/mcunningham/.bashrc
# source /home/mcunningham/.bashrc

# sudo apt install git -y
# mkdir ~/repos
# cd ~/repos
# git config --global user.email "mcunningham@themeetgroup.com"
# git config --global user.name "Michael Cunningham"
# git clone https://github.com/michaelcunningham/mcunningham.git
# The next can be done once the id_rsa files are setup
# Then go to github and add SSH key - https://github.com/settings/keys
# git remote set-url origin git@github.com:michaelcunningham/mcunningham.git

# sudo apt install mariadb-client-core -y
# sudo apt install postgresql-client -y
# sudo apt install screen -y
# sudo apt install dos2unix -y
# sudo apt install python3-pip -y
# sudo apt install python3-boto3 -y
# sudo apt install python3-botocore -y   # this will be installed with python3-boto3
# pip3 install duckdb --break-system-packages

# cd /mnt/install
# sudo ./aws/install --update
# mkdir -p ~/.aws
# cp -rp /mnt/vmshare/virtualbox/.aws/* ~/.aws

# This is for sqlplus
# cd /usr/lib/x86_64-linux-gnu/
# sudo ln -s libaio.so.1t64 libaio.so.1

# sudo apt install vim
# sudo update-alternatives --config editor
#   change to use vim.basic

# sudo apt install jq -y

# Created a ~/.ssh/config file with the following
host gerrit.meetmecorp.com
 HostName gerrit.meetmecorp.com
 IdentityFile ~/.ssh/id_rsa_gerrit

Host *
    StrictHostKeyChecking no
    UserKnownHostsFile=/dev/null
    ServerAliveInterval 300
    ServerAliveCountMax 2
    HostKeyAlgorithms=+ssh-rsa

Host mmdb-tagged-pgbouncer*.mtmeprod.com
#  User mcunningham
  ProxyJump euw1-jumpbox.amz.mtmemgmt.com
#  IdentityFile ~/.ssh/id_rsa.pub
#  RemoteCommand ssh -A mcunningham@%n

Host 10.164.*
  ProxyJump euw1-jumpbox.amz.mtmemgmt.com

Host video-lovoo-aurora*.rds.amazonaws.com
  ProxyJump euw1-jumpbox.amz.mtmemgmt.com

Host runbox1.scs.mtmeprod.net
  User luminate_ro@scs-connector
  HostName scs-connector.ssh.tmg.luminatesec.com
  IdentityFile ~/.ssh/luminate_ssh_key.pem
  RemoteCommand ssh -A luminate@%n
  RequestTTY yes

# Then set permissions
# chmod 600 ~/.ssh/config

# This part is for infoblox
# pip3 install infoblox_client --break-system-packages
# pip3 install pyOpenSSL --break-system-packages
# sudo ln -s /usr/lib/postgresql/16/bin/pg_config /usr/bin/pg_config
# sudo apt install libpq-dev -y
# pip3 install psycopg2 --break-system-packages
# create the ~/.netrc file
# chmod 600 ~/.netrc

# Install Java Development Kit so I have jconsole to pause qcontrol
# sudo apt install openjdk-11-jdk

# Install xterm so window can be resized with command line
# sudo apt install xterm

# The following is to get rid of postgresql-16 stuff and install postgresql-12 stuff
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ACcc4CF8
# echo "deb http://apt.postgresql.org/pub/repos/apt noble-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list
# sudo apt update
# sudo apt remove postgresql-client postgresql-client-16 postgresql-client-common
# sudo apt install postgresql-client-12 postgresql-client-common

# The following was installed to prepare for script development for confluence page updates
# It is not needed normally
# sudo pip3 uninstall psycopg2 --break-system-packages  - this is just in case the psycopg2 module is installed
# sudo pip3 install psycopg2-binary --break-system-packages
# sudo pip3 install pystache --break-system-packages

