# install or update necessary python3 plugins (for VIM compiled with +python3, like ubuntu 16.04)
sudo pip3 install -U jedi flake8 autopep8 git+git://github.com/powerline/powerline

# Start and update submodules
git submodule init 
git pull --recurse-submodules
git submodule update --remote --recursive
