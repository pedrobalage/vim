# Vim gnome is used to provide +clipboard feature
sudo apt-get install vim-gnome

# install or update necessary python plugins
sudo pip install -U jedi flake8 autopep8

# Start and update submodules
git submodule init 
git pull --recurse-submodules
git submodule update --remote --recursive
 
 
 
 
 

