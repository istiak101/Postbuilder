#TODO Rename Debian package to RHEL

dnf upgrade-minimal -y

dnf install -y epel-release
dnf install -y ansible ethtool engrampa filezilla gedit gimp git ImageMagick mariadb-server patch screen sshpass vnstat wget wireguard
dnf install -y rpm-sign seahorse
dnf install -y golang
dnf install -y p7zip p7zip-plugins poedit gcolor3 sdrpp
dnf install -y transmission
# mold linker https://github.com/rui314
dnf install -y mold
dnf install fedora-packager fedora-review
sudo dnf install krb5-workstation

mysql_secure_installation

install_qemu() {
  sudo dnf install -y SLOF
  sudo dnf install -y qemu qemu-kvm qemu-system-arm virt-manager
}

install_python() {
  # Do not compile
  # sudo dnf install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev libbz2-dev liblzma-dev uuid-dev tk8.6-dev
  # py_version=3.10.2
  # wget https://www.python.org/ftp/python/${py_version}/Python-${py_version}.tgz
  # tar -xf Python-${py_version}.tgz
  # cd Python-${py_version}
  # ./configure --enable-optimizations
  # core=$(nproc)
  # make -j $core
  # sudo make install
  sudo dnf install -y python310 python310-pip python310-devel
}

install_pycharm() {
  user=$(whoami)
  wget https://files.istiak.com/others/pycharm-community-2021.3.tar.gz
  tar -xf pycharm-community-2021.3.tar.gz
  mv pycharm-community-2021.3 /home/${user}/pycharm

  # MySQL Dependency
  # sudo dnf install -y libmysqlclient-dev
  sudo dnf install -y libmariadb-dev
  sudo dnf install -y python3-dev
}

install_codeblocks() {
#TODO Build a RPM package for this
#  sudo dnf install -y build-essential libwxgtk3.0-gtk3-dev libgtk-3-dev libglib2.0-dev xterm
#  wget https://files.istiak.com/source/codeblocks-20.03.tar.xz
#  tar -xf codeblocks-20.03.tar.xz
#  cd codeblocks-20.03
#  ./configure
#  core=$(nproc)
#  make -j $core
#  sudo make install
#  sudo ldconfig
  dnf install -y codeblocks
}

