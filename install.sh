#!/bin/bash
# I'm new with Bash and still learning (i only know the basics) so I got AI to write some of the little bits in it. Apoligies.
echo "Downloading Discord (I hope)"
wget -O discord.deb "https://discord.com/api/download?platform=linux&format=deb"
sudo apt update && sudo apt install ./discord.deb -y

echo "Dependencies installed."
# I asked AI to write this little bit, once again apoligies.
read -p "Set alias? [y/n]: " response

if [[ "$response" =~ ^[Yy]$ ]]; then
    if ! grep -q 'alias csdisc=' ~/.bashrc; then
        echo 'alias csdisc="python3 run.py"' >> ~/.bashrc
        echo "csdisc made"
    else
        echo "And why the FUCK did you make this alias beforehand?"
    fi
else
    echo "Fine then... be that way then..."
fi
source ~/.bashrc
