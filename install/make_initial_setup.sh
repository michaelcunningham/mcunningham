# First thing is to add the following line to sudoers file
# Change visudo editor with:
#    sudo update-alternatives --config editor
#
# sudu visudo - and add the following line
# michael ALL=(root) NOPASSWD: ALL

# sudo mkdir /mnt/install
# sudo chown michael.michael /mnt/install
# sudo mkdir /mnt/dba
# sudo chown michael.michael /mnt/dba
# sudo mkdir /mnt/dbascripts
# sudo chown michael.michael /mnt/dbascripts
# sudo mkdir /mnt/vmshare
# sudo chown michael.michael /mnt/vmshare

# sudo mount -t vboxsf -o uid=1000,gid=1000 vd_dba /mnt/dba
# sudo mount -t vboxsf -o uid=1000,gid=1000 vd_vmshare /mnt/vmshare
# sudo mount -t vboxsf -o uid=1000,gid=1000 vd_dbascripts /mnt/dbascripts
# sudo mount -t vboxsf -o uid=1000,gid=1000 vd_install /mnt/install

# ln -s /mnt/vmshare/repos/ /home/michael/repos
# cp /mnt/vmshare/virtualbox/.pgpass /home/michael/.pgpass
# chmod 600 /home/michael/.pgpass
# cp /mnt/vmshare/virtualbox/.bashrc_new_mint_machine /home/michael/.bashrc
# source /home/michael/.bashrc

# sudo apt install git -y
# sudo apt install mariadb-client-core-10.3 -y
# sudo apt install python3.9 -y
# sudo apt install postgresql-client-12 python3-venv -y
# sudo ln -s /usr/bin/python3 /usr/bin/python
# sudo /mnt/install/awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
# sudo apt install python3-boto3 -y
# sudo apt install nodejs -y
# sudo apt install npm -y
# sudo apt install dos2unix -y
# sudo apt install vim -y

# mkdir -p /home/michael/.aws
# cp -rp /mnt/vmshare/virtualbox/.aws/* /home/michael/.aws

# mkdir -p /tmp/chrome
# cd /tmp/chrome
# wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# sudo gdebi google-chrome-stable_current_amd64.deb
# cd -
# rm -rf /tmp/chrome

# echo "set t_ti= t_te=" > /home/michael/.vimrc

# cd /mnt/install
# wget http://download.redis.io/redis-stable.tar.gz
# tar xvzf redis-stable.tar.gz
# cd redis-stable
# sudo make MALLOC=libc
# sudo ln -s /mnt/install/redis-stable/src/redis-cli /usr/bin/redis-cli
# NOTE: sudo make test did not work and I think it's because tcl is not installed
# cd ..
# rm redis-stable.tar.gz

# Install Java Development Kit so I have jconsole to pause qcontrol
# sudo apt install openjdk-11-jdk

# Install for AWS Session Manager plugin on Ubuntu
# Instructions came from here : https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html#install-plugin-debian
# curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb"
# sudo dpkg -i session-manager-plugin.deb
# To uninstall
#     sudo dpkg -r session-manager-plugin

# For ARMS
# sudo apt install docker.io
# mkdir -p /mnt/install/Terraform_1.3.9
# cd /mnt/install/Terraform_1.3.9
# wget https://releases.hashicorp.com/terraform/1.3.9/terraform_1.3.9_linux_amd64.zip
# sudo unzip terraform_1.3.9_linux_amd64.zip
# sudo chmod a+x terraform
# sudo ln -fs /mnt/install/Terraform_1.3.9/terraform /usr/bin/terraform
# sudo apt install groovy

# The following was so I could upgrade node for use with dynamodb-mass-delete
# which uses the aws-sdk. aws/sdk would not install due to old version of node.
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
# source ~/.bashrc
# sudo npm install -g n
# sudo n lts
# sudo n latest
# sudo n prune
# nvm install node
# npm install -g npm@latest

# For pupmanage
# sudo apt install python3-github
