dnf install -y rpmdevtools rpmlint epel-release
dnf install -y mock screen subscription-manager
cd /etc/rhsm/ca
curl -O https://raw.githubusercontent.com/istiak101/Postbuilder/main/redhat-uep.pem

architecture=$(arch)
if echo $architecture | grep -q "aarch64"; then
  mock -r epel-7-aarch64 --init
  mock -r rhel+epel-8-aarch64 --init
  mock -r rhel+epel-9-aarch64 --init
elif echo $architecture | grep -q "x86_64"; then
  mock -r epel-7-x86_64 --init
  mock -r rhel+epel-8-x86_64 --init
  mock -r rhel+epel-9-x86_64 --init
fi

#TODO
#set TMPFS

useradd istiak
usermod -a -G mock istiak
su -l istiak
rpmdev-setuptree
