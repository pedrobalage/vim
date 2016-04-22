# Vim gnome is used to provide +clipboard feature
sudo apt-get install vim-gnome

# install or update necessary python2 plugins (for VIM compiled with +python)
sudo pip install -U jedi flake8 autopep8

# install or update necessary python3 plugins (for VIM compiled with +python3, like ubuntu 16.04)
sudo pip3 install -U jedi flake8 autopep8

# Start and update submodules
git submodule init 
git pull --recurse-submodules
git submodule update --remote --recursive
 
 
 
 
 

