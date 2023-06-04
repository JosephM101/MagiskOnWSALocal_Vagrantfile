# MagiskOnWSALocal_Vagrantfile

A Vagrantfile for MagiskOnWSALocal that you can use on Windows. Useful if installing WSL causes problems with other virtualization software, or if you just don't want to use it.

<b>Please note: this documentation is *very* much incomplete.</b>


## How to use
For starters, Vagrant and VirtualBox need to be installed. You can get Vagrant from [here](https://developer.hashicorp.com/vagrant/downloads), and VirtualBox from [here](https://www.virtualbox.org/wiki/Downloads).

Once those are installed, clone this repository using Git or [download the repo's zip file](https://github.com/JosephM101/MagiskOnWSALocal_Vagrantfile/archive/refs/heads/main.zip) and extract it.

if you're on Windows, you can use the `Run.ps1` PowerShell script to automate the process.

I'm working on testing scripts for macOS and Linux. For now, on these (and other) platforms, open the folder in a terminal, and use the `vagrant up` command.