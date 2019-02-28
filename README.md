# zelcash-centos7

## Requirements
1. [Vagrant](https://www.vagrantup.com/intro/index.html)
1. CentOS7 Vagrant Box: `vagrant box add centos7x64 https://github.com/holms/vagrant-centos7-box/releases/download/7.1.1503.001/CentOS-7.1.1503-x86_64-netboot.box`

## Setting up and provisioning Vagrant Box
1. Clone this repository & cd
1. Run `vagrant up`

The Vagrant Box should automatically be provisioned.

Provisioning includes:
* Install ZelCash dependencies
* Compile ZelCash from source
* Download ZCash parameters and ZelCash bootstrap
* Create `zelcash.conf`
* Run `zelcashd`

SSH into Vagrant Box using `vagrant ssh`

