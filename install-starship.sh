#!/bin/bash

# install
curl -sS https://starship.rs/install.sh | sh

# adjust .bashrc
echo "# start starship automatically" >>~/.bashrc
echo "eval "$(starship init bash)"" >>~/.bashrc
