#!/bin/bash

sudo yum upgrade -y
sudo yum install -y\
  autoconf libtool unzip git python \
  wget curl  automake gcc gcc-c++ patch \
  glibc-static libstdc++-static

sudo yum install -y centos-release-scl-rh
sudo yum install -y devtoolset-3-gcc devtoolset-3-gcc-c++
sudo update-alternatives --install /usr/bin/gcc-4.9 gcc-4.9 /opt/rh/devtoolset-3/root/usr/bin/gcc 10
sudo update-alternatives --install /usr/bin/g++-4.9 g++-4.9 /opt/rh/devtoolset-3/root/usr/bin/g++ 10
scl enable devtoolset-3 bash

git clone https://github.com/zelcash/zelcash.git
cd zelcash
./zcutil/build.sh -j$(nproc)
make
./zcutil/fetch-params.sh

mkdir ~/.zelcash
echo "rpcuser=username" >> ~/.zelcash/zelcash.conf
echo "rpcpassword=`head -c 32 /dev/urandom | base64`" >> ~/.zelcash/zelcash.conf
echo "rpcallowip=127.0.0.1" >> ~/.zelcash/zelcash.conf
echo "addnode=explorer.zel.cash" >> ~/.zelcash/zelcash.conf
echo "addnode=explorer.zel.zelcore.io" >> ~/.zelcash/zelcash.conf
echo "txindex=1" >> ~/.zelcash/zelcash.conf

wget https://zelcore.io/zelcashbootstraptxindex.zip
unzip -o zelcashbootstraptxindex.zip -d ~/.zelcash
rm zelcashbootstraptxindex.zip

./src/zelcashd
