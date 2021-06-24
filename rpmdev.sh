dnf install -y rpmdevtools rpmlint epel-release
dnf install -y mock

architecture=$(uname -m)
if echo $architecture | grep -q "aarch64"; then
  mock -r epel-7-aarch64 --init
  mock -r epel-8-aarch64 --init
  mock -r epel-9-aarch64 --init
elif echo $architecture | grep -q "x86_64"; then
  mock -r epel-7-x86_64 --init
  mock -r epel-8-x86_64 --init
  mock -r epel-9-x86_64 --init
fi

useradd istiak
usermod -a -G mock istiak
su -l istiak
rpmdev-setuptree
