# vagrant-ansible-control-node

Quickly spin a local Ansible control node with [Vagrant](https://www.vagrantup.com/) + [VirtualBox](https://www.virtualbox.org/).


## Usage

    $ git clone https://github.com/Eigenbahn/vagrant-ansible-control-node
    $ cd vagrant-ansible-control-node
    $ vagrant up


## Configuration

Some stuff can be tweaked in the [Vagrantfile](./Vagrantfile):

- `config.vm.network`: the private IP address to access your host via SSH. If you only use `vagrant ssh` to connect, you don't care about this.
- `config.vm.synced_folder`: A host folder to mount onto the guest filesystem. Multiple entries are allowed.
- `vb.name`: the alias given to the VirtualBox VM / Vagrant machine
- `vb.memory`: the amount of RAM (in MB) allocated to the VM

Additionally, you can adjust a few variables in the [ansible](./provision/ansible.yml) provisioner:

 - `my_reinstall_ansible_from_ppa`: When `yes`, reinstall Ansible from the bleeding edge official Ansible PPA. Defaults to `no`.
 - `my_disable_ansible_host_key_change_check`: When `yes`, Ansible won't complain when the identity of a remoite host changes. Defaults to `yes`.
 - `my_ansible_additonal_role_path`: When set, additonal folders when roles are stored. Separator is `:`.
 - `my_ansible_nb_parallel_targets`: When set, number of hosts that can be provisioned in parallel.


## Implementation details

#### Basics

We let Vagrant install Ansible itself by relying on the [Ansible Local Provisioner](https://www.vagrantup.com/docs/provisioning/ansible_local).

2 instances of the provisioning scripts get launched sequentially:

 - [normalize](./provision/normalize.yml): make the machine more compliant with Vagrant recommandations
 - [ansible](./provision/ansible.yml): tweak Ansible, eventually reinstall a more recent version


#### Choice of base box

I choose to use a Debian base box as I'm more familiar with this familly of distribution.

I selected the [official Debian 10 box](https://app.vagrantup.com/debian/boxes/contrib-buster64).

I also projected using [generic/debian10](https://app.vagrantup.com/generic/boxes/debian10) from the [Roboxes](https://roboxes.org/) project but it came bundled with an old version of VirtualBox guest additions.


#### Better defaults

A lot of boxes only come with SSH authentication by key.

As [per official recommandations](https://www.vagrantup.com/docs/boxes/base#default-user-settings), we also set the `vagrant` and `root` users password to `vagrant` and authorize SSH by password.

We also authorize SSH as root.


## Going further

If you're an Emacs user, you might want to check out package [magrant](https://github.com/p3r7/magrant) for easier Vagrant cli operations.
