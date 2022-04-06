#TODO Rename Debian package to RHEL

dnf upgrade-minimal -y

dnf install -y epel-release
dnf install -y ansible ethtool filezilla gimp git mariadb-server putty screen sshpass vnstat wget wireguard

mysql_secure_installation

install_qemu() {
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
  sudo dnf install -y python39 python39-pip python39-devel
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
  sudo dnf install -y build-essential libwxgtk3.0-gtk3-dev libgtk-3-dev libglib2.0-dev xterm
  wget https://files.istiak.com/source/codeblocks-20.03.tar.xz
  tar -xf codeblocks-20.03.tar.xz
  cd codeblocks-20.03
  ./configure
  core=$(nproc)
  make -j $core
  sudo make install
  sudo ldconfig
}

