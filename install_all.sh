sudo apt install gcc-12
sudo apt install python3
sudo apt install libeigen3-dev
mkdir -p work/tools
mv qrouter-1.4.87.tgz work/tools/.
mv magic-8.3.486.tgz work/tools/.
mv netgen-1.5.276.tgz work/tools/.
mv qflow-1.4.103.tgz work/tools/.
mv yosys-yosys-0.41.tar.gz work/tools/.
cd work/tools
sudo apt-get install build-essential bison flex \
	libreadline-dev gawk tcl-dev tk-dev libffi-dev git \
	graphviz xdot pkg-config python3 --assume-yes
sudo apt install libglu1-mesa-dev freeglut3-dev --assume-yes
#wget "https://github.com/Kitware/CMake/releases/download/v3.29.6/cmake-3.29.6.tar.gz"
#tar -xvzf cmake-3.29.6.tar.gz
#cd cmake-3.29.6/
wget "https://github.com/Kitware/CMake/releases/download/v3.13.0/cmake-3.13.0.tar.gz"
tar -xvzf cmake-3.13.0.tar.gz
cd cmake-3.13.0/
sudo ./bootstrap --prefix=/usr/local
sudo make -j$(nproc)
sudo make install 
cd ../
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
sudo apt-add-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-6.0 main" -y 
sudo apt-get update 
sudo apt-get install -y clang-6.0 --assume-yes
sudo apt-get install gsl-bin libgsl0-dev --assume-yes
sudo add-apt-repository ppa:saltmakrell/ppa -y 
sudo apt-get update

tar -xvzf yosys-yosys-0.41.tar.gz
cd yosys-yosys-0.41/
make
sudo make install
cd ../

git clone https://github.com/rubund/graywolf.git
cd graywolf/
mkdir build
cd build
cmake ..
sudo make
sudo make install
cd ../../

tar -xvzf qrouter-1.4.87.tgz
cd qrouter-1.4.87
sudo ./configure 
sudo make
sudo make install 
cd ../

sudo apt-get install m4 --assume-yes
sudo apt-get install libx11-dev --assume-yes
sudo apt-get install tcsh --assume-yes
sudo apt-get install tclsh --assume-yes

tar -xvzf magic-8.3.486.tgz
cd magic-8.3.486
sudo ./configure
sudo make
sudo make install
cd ../

tar -xvzf netgen-1.5.276.tgz
cd netgen-1.5.276
sudo ./configure 
sudo make
sudo make install
cd ../

tar -xvzf qflow-1.4.103.tgz
cd qflow-1.4.103
sudo ./configure 
sudo make
sudo make install
sudo apt-get install autoconf --assume-yes
sudo apt-get install automake --assume-yes
sudo apt-get install libtool --assume-yes
sudo apt-get install swig --assume-yes
cd ../

git clone https://github.com/The-OpenROAD-Project/OpenSTA.git
cd OpenSTA
mkdir build
cd build
sudo cmake ..
sudo make
cd ../
sudo ln -s $PWD/app/sta /usr/bin/sta

cd ../
sudo apt-get install tcllib --assume-yes

sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
sudo apt-get update
sudo apt-get install gcc-12 g++-12 --assume-yes
cd /usr/bin
sudo rm -rf g++
sudo ln -s g++-12 /usr/bin/g++
sudo rm -rf gcc
sudo ln -s gcc-12 /usr/bin/gcc
cd -
sudo apt-get install iverilog
sudo apt-get install gtkwave
git clone https://github.com/OpenTimer/OpenTimer.git
cd OpenTimer/
mkdir build
cd build
cmake ../
sudo make
cd ../
sudo ln -s $PWD/bin/ot-shell /usr/bin/OpenTimer
cd ../../
sudo apt-get update
sudo apt-get install python3-tk
