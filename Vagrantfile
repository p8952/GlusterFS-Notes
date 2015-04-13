VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "centos-6.6-64-puppet"
	config.vm.box_url = "https://vagrantcloud.com/puppetlabs/boxes/centos-6.6-64-puppet/versions/1.0.1/providers/virtualbox.box"
	config.vm.box_download_checksum_type = "sha1"
	config.vm.box_download_checksum = "a311b8f263fd1bee32b418cce1f2281c9b98b8ba"

	config.ssh.username = 'root'
	config.ssh.password = 'puppet'
	config.ssh.insert_key = 'true'

	config.vm.network "private_network", virtualbox__intnet: "gfs", auto_config: false

	config.vm.provision "shell", inline: "yum install -y -q augeas"
	config.vm.provision "shell", inline: "mkdir -p /etc/facter/facts.d"

	config.vm.define "gfs01" do |gfs01|
		gfs01.vm.provision "shell", inline: "echo 'vagrant_hostname=gfs01' > /etc/facter/facts.d/vagrant.txt"
		gfs01.vm.provision "shell", inline: "puppet apply /vagrant/puppet/gfs.pp"
	end

	config.vm.define "gfs02" do |gfs02|
		gfs02.vm.provision "shell", inline: "echo 'vagrant_hostname=gfs02' > /etc/facter/facts.d/vagrant.txt"
		gfs02.vm.provision "shell", inline: "puppet apply /vagrant/puppet/gfs.pp"
	end

	config.vm.define "gfs03" do |gfs03|
		gfs03.vm.provision "shell", inline: "echo 'vagrant_hostname=gfs03' > /etc/facter/facts.d/vagrant.txt"
		gfs03.vm.provision "shell", inline: "puppet apply /vagrant/puppet/gfs.pp"
	end

	config.vm.define "gfs04" do |gfs04|
		gfs04.vm.provision "shell", inline: "echo 'vagrant_hostname=gfs04' > /etc/facter/facts.d/vagrant.txt"
		gfs04.vm.provision "shell", inline: "puppet apply /vagrant/puppet/gfs.pp"
	end
end
