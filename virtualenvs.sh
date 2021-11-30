source $HOME/.bash_profile
pyenv install -s 2.7.18
pyenv activate nvim-python2
if [ $? -ne 0 ]; then
  pyenv virtualenv 2.7.18 nvim-python2
  pyenv activate nvim-python2
fi
pip install --upgrade --force-reinstall -r requirements-nvim-python2.txt
pyenv deactivate

pyenv install -s 3.9.5
pyenv activate nvim-python3
if [ $? -ne 0 ]; then
  pyenv virtualenv 3.9.5 nvim-python3
  pyenv activate nvim-python3
fi
pip install --upgrade --force-reinstall -r requirements-nvim-python3.txt
pyenv deactivate
