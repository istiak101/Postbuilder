#!/bin/bash
# Postbuilder By Istiak Ferdous
# Author: Istiak Ferdous
# Website: https://istiakferdous.com
# Email: hello@istiakferdous.com

sudo apt update && sudo apt upgrade -y

sudo apt install -y ethtool openssh-server filezilla putty vlc git mariadb-server wireguard vnstat wget gimp ansible sshpass
wg genkey | sudo tee /etc/wireguard/privatekey | wg pubkey | sudo tee /etc/wireguard/publickey

mysql_secure_installation

wget https://files.istiak.com/deb/GitHubDesktop-linux-2.9.6-linux1.deb
wget https://files.istiak.com/deb/code_1.61.2-1634656828_amd64.deb
wget https://files.istiak.com/deb/Web%20Browser/google-chrome-stable_current_amd64.deb
wget https://files.istiak.com/deb/virtualbox-6.1_6.1.30-148432~Ubuntu~eoan_amd64.deb
sudo dpkg -i GitHubDesktop-linux-2.9.6-linux1.deb code_1.61.2-1634656828_amd64.deb google-chrome-stable_current_amd64.deb virtualbox-6.1_6.1.30-148432~Ubuntu~eoan_amd64.deb


# Node.js
wget https://nodejs.org/dist/v16.3.0/node-v16.3.0-linux-x64.tar.xz
wget https://nodejs.org/dist/v14.17.0/node-v14.17.0-linux-x64.tar.xz

install_qemu() {
  sudo apt install -y qemu qemu-kvm qemu-system-arm virt-manager
}

install_python() {
  # Do not compile
  # sudo apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev libbz2-dev liblzma-dev uuid-dev tk8.6-dev
  # py_version=3.9.6
  # wget https://www.python.org/ftp/python/${py_version}/Python-${py_version}.tgz
  # tar -xf Python-${py_version}.tgz
  # cd Python-${py_version}
  # ./configure --enable-optimizations
  # core=$(nproc)
  # make -j $core
  # sudo make install
  sudo apt install -y python3 python3-pip
}

install_pycharm() {
  user=$(whoami)
  wget https://files.istiak.com/others/pycharm-community-2021.3.tar.gz
  tar -xf pycharm-community-2021.3.tar.gz
  mv pycharm-community-2021.3 /home/${user}/pycharm

  # MySQL Dependency
  # sudo apt install -y libmysqlclient-dev
  sudo apt install -y libmariadb-dev
  sudo apt install -y python3-dev
}

install_go() {
  sudo apt install -y build-essential
  wget https://golang.org/dl/go1.16.5.linux-amd64.tar.gz
  tar -xf go1.16.5.linux-amd64.tar.gz
}

install_brave_browser() {
  sudo apt install -y apt-transport-https curl
  sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
  echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
  sudo apt update
  sudo apt install -y brave-browser
}

install_codeblocks() {
  sudo apt install -y build-essential libwxgtk3.0-gtk3-dev libgtk-3-dev libglib2.0-dev xterm
  wget https://files.istiak.com/source/codeblocks-20.03.tar.xz
  tar -xf codeblocks-20.03.tar.xz
  cd codeblocks-20.03
  ./configure
  core=$(nproc)
  make -j $core
  sudo make install
  sudo ldconfig
}

install_mysql_workbench() {
  wget https://files.istiak.com/deb/mysql-workbench-community_8.0.25-1ubuntu21.04_amd64.deb
  sudo dpkg -i mysql-workbench-community_8.0.25-1ubuntu21.04_amd64.deb
}

# Handbrake
sudo apt install -y libtool-bin meson nasm cmake libnuma-dev

install_obs() {
  wget https://cdn-fastly.obsproject.com/downloads/cef_binary_4280_linux64.tar.bz2
  tar -xjf ./cef_binary_4280_linux64.tar.bz2
  git clone --recursive https://github.com/obsproject/obs-studio.git
  cd obs-studio
  mkdir build && cd build
  cmake -DUNIX_STRUCTURE=1 -DBUILD_BROWSER=ON -DCEF_ROOT_DIR="../../cef_binary_4280_linux64" ..
  make -j4
  sudo make install
}

install_brave_browser
install_qemu
install_python
install_pycharm
install_codeblocks
install_go
install_mysql_workbench
install_obs
