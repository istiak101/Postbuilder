apt update
apt install -y pbuilder debootstrap devscripts

architecture=$(arch)
if echo $architecture | grep -q "aarch64"; then
  /usr/sbin/pbuilder --create --distribution bullseye --architecture arm64 --basetgz /var/cache/pbuilder/bullseye-arm64-base.tgz
  /usr/sbin/pbuilder --create --distribution buster --architecture arm64 --basetgz /var/cache/pbuilder/buster-arm64-base.tgz
elif echo $architecture | grep -q "x86_64"; then
  /usr/sbin/pbuilder --create --distribution bullseye --architecture amd64 --basetgz /var/cache/pbuilder/bullseye-amd64-base.tgz
  /usr/sbin/pbuilder --create --distribution buster --architecture amd64 --basetgz /var/cache/pbuilder/buster-amd64-base.tgz
fi

useradd istiak
