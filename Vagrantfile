# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/jessie64"
  config.push.define "atlas" do |push|
    push.app = "growse/debian-jessie64-puppet4"
  end
  config.vm.provision "shell", inline: <<-SHELL
    wget http://apt.puppetlabs.com/puppetlabs-release-pc1-jessie.deb
    dpkg -i puppetlabs-release-pc1-jessie.deb
    apt-get install apt-transport-https
    apt-get update
    apt-get install -y puppet-agent
    apt-get dist-upgrade -y
    /opt/puppetlabs/puppet/bin/gem install hiera-eyaml
    apt-get clean
    dd if=/dev/zero of=/empty bs=1M
    rm /empty
  SHELL
end
