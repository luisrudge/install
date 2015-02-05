sudo apt-get -y install curl

echo "Add repos"
#Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
#Elementary
sudo apt-add-repository -y ppa:versable/elementary-update
#Skype
sudo apt-add-repository -y "deb http://archive.canonical.com/ubuntu/ precise partner"
#Git
sudo add-apt-repository -y ppa:git-core/ppa
#node
curl -sL https://deb.nodesource.com/setup | bash -
#mono
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee --append /etc/apt/sources.list.d/mono-xamarin.list
echo "deb http://download.mono-project.com/repo/debian wheezy-libtiff-compat main" | sudo tee -a /etc/apt/sources.list.d/mono-xamarin.list


echo "Update packages and elementaryOs"
sudo apt-get -y update
sudo apt-get -y dist-upgrade

echo "Remove some apps"
sudo apt-get -y purge midori-granite
sudo apt-get -y purge noise
sudo apt-get -y purge software-center
sudo apt-get -y purge scratch-text-editor
sudo apt-get -y purge bluez
sudo apt-get -y purge modemmanager
sudo apt-get -y purge geary
sudo rm -rf /usr/lib/plugs/GnomeCC/gnomecc-bluetooth.plug
sudo rm -rf /usr/lib/plugs/GnomeCC/gnomecc-wacom.plug

echo "Install stuff"
sudo apt-get -y install google-chrome-stable
sudo apt-get -y install elementary-desktop elementary-tweaks
sudo apt-get -y install wingpanel-slim indicator-synapse
sudo apt-get -y install skype
sudo apt-get -y install git
sudo apt-get -y install nodejs
sudo apt-get install -y mono-devel
mozroots --import --sync

echo "setup NPM"
mkdir ~/npm
npm config set prefix ~/npm
echo  'export PATH="$PATH:$HOME/npm/bin"' >> ~/.bashrc
npm i -g gulp grunt-cli yo karma-cli typescript bower

#libuv
echo "setup libuv"
sudo apt-get -y install gyp automake make libtool
wget http://libuv.org/dist/v1.0.2/libuv-v1.0.2.tar.gz
tar -xvf libuv-v1.0.2.tar.gz
cd libuv-v1.0.2/
sudo ./gyp_uv.py -f make -Duv_library=shared_library
sudo make -C out
sudo cp out/Debug/lib.target/libuv.so /usr/lib/libuv.so.1.0.2
sudo ln -s libuv.so.1.0.2 /usr/lib/libuv.so.1

#aspnet
echo "aspnet5"
wget https://raw.githubusercontent.com/aspnet/Home/master/kvminstall.sh
sh kvminstall.sh
source ~/.kre/kvm/kvm.sh
kvm upgrade

#atom
echo "atom"
cd ~/Downloads
mkdir atom
cd atom
wget https://github.com/atom/atom/releases/download/v0.177.0/atom-amd64.deb
sudo dpkg --install atom-amd64.deb

apm install atom-beautify
apm install atom-typescript-tools
apm install bezier-curve-editor
apm install color-picker
apm install css-snippets
apm install editorconfig
apm install emmet
apm install language-csharp
apm install autocomplete-plus-async
apm install omnisharp-atom
apm install language-cshtml
apm install language-css-plus
apm install language-typescript
apm install less-than-slash
apm install linter-tslint
apm install seti-syntax
apm install seti-ui

#versions
echo "versions"
atom -v
mono --version
node -v
npm -v
git --version
kvm list
