require 'json'
Dir.mkdir("out") unless Dir.exist?("out")

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/lunar64"
  #config.vm.box = "debian/buster64"
  
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = File.exist?("vagrant_config.json") ? JSON.parse(File.read("vagrant_config.json", encoding: 'bom|utf-8'))["cpu_cores"].to_i : 4
  end
  
  config.vm.provision "shell", inline: <<-SHELL
    # WSA_ARGS="--arch x64 --release-type Insider Private --root-sol magisk --magisk-ver stable --gapps-brand MindTheGapps --gapps-variant pico --remove-amazon"
    WSA_ARGS="--arch x64 --release-type latest --root-sol magisk --magisk-ver stable --gapps-brand MindTheGapps --remove-amazon --custom-model cheetah"
    WSA_COMPRESSION_SETTINGS="--compress-format zip"
    OUTPUT_DIR="/vagrant/out"

    # sudo add-apt-repository ppa:deadsnakes/ppa
    sudo apt-get update
    sudo apt-get install -y git

    echo "Installing prerequisites"
    sudo apt-get install -y nano -y
    sudo apt-get install -y lzip patchelf e2fsprogs python3 python3-pip aria2 p7zip-full attr unzip whiptail qemu-utils -y
    sudo apt-get clean
    
    # git clone https://github.com/LSPosed/MagiskOnWSALocal.git && cd MagiskOnWSALocal
    git clone https://github.com/YT-Advanced/WSA-Script && cd WSA-Script

    python3 -m pip install requests pyyaml

    ./scripts/build.sh $WSA_ARGS

    echo "Copying build artifacts to 'out' directory..."
    cd output
    cp -r * $OUTPUT_DIR # Copy everything in the output folder to the host
    rm -rf *  # Remove everything in the output directory
    echo "Done!"
    
    shutdown now
  SHELL
end