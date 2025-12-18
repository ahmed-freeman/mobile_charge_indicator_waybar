#!/bin/bash

# Make mobile.sh executable
chmod +x mobile.sh

# Copy mobile.sh to ~/.local/bin
mkdir -p ~/.local/bin
cp mobile.sh ~/.local/bin/

# Go to ~/.local/bin
cd ~/.local/bin || exit

# Rename to 'mobile'
mv -f mobile.sh mobile
chmod +x mobile

echo
echo "Installation completed successfully."
echo "Running mobile script now..."
echo

# Run the script immediately after installation
exec ~/.local/bin/mobile
