#!/bin/bash
echo "Download script"
wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh

echo "Grant permission"
chmod +x ./dotnet-install.sh

echo "Install latest release"
./dotnet-install.sh --version latest

echo "Do you want to install .NET Runtime? [y/n]"
read -r installRuntime
if [ "$installRuntime" == "y" ]; then
  ./dotnet-install.sh --version latest --runtime aspnetcore
fi
