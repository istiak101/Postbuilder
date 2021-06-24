#!/bin/bash
# Postbuilder By Istiak Ferdous
# Author: Istiak Ferdous
# Website: https://istiakferdous.com
# Email: hello@istiakferdous.com


# Issues:
# Bullseye-backports don't have libvirt-daemon
# Gnome mobile-broadband-provider-info database is outdated
# I will install my patch manually before my commits get merged

apt update && apt upgrade -y

apt install -y filezilla git wireguard vnstat wget tar

wget https://files.istiak.com/deb/GitHubDesktop-linux-2.9.6-linux1.deb
wget https://files.istiak.com/deb/code_1.61.2-1634656828_amd64.deb
wget https://files.istiak.com/deb/Web%20Browser/google-chrome-stable_current_amd64.deb
dpkg -i GitHubDesktop-linux-2.9.6-linux1.deb code_1.61.2-1634656828_amd64.deb google-chrome-stable_current_amd64.deb

install_bangla_fonts() {
  wget https://files.istiak.com/
}

install_qemu() {
  apt install -y qemu qemu-kvm qemu-system-arm virt-manager libvirt-daemon
}

install_virtualbox() {
  apt install -y build-essential
  apt install -y linux-headers-amd64 linux-headers-5.10.0-10-amd64
  wget https://files.istiak.com/deb/virtualbox-6.1_6.1.30-148432~Debian~bullseye_amd64.deb
  dpkg -i virtualbox-6.1_6.1.30-148432~Debian~bullseye_amd64.deb
}

install_android_studio() {
  wget https://files.istiak.com/others/android-studio-2020.3.1.26-linux.tar.gz
  tar -xf android-studio-2020.3.1.26-linux.tar.gz
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

install_brave_browser() {
  apt install -y apt-transport-https curl
  curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
  echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
  apt update
  apt install -y brave-browser
}

install_bangla_fonts
install_brave_browser
install_qemu
install_virtualbox
install_pycharm
install_android_studio
