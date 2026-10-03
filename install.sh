#!/bin/bash
# I'm new with Bash and still learning (i only know the basics) so I got AI to write some of the little bits in it. Apoligies.
echo "Updating system apt and adding official Mozilla repositories..."
sudo apt update && sudo apt install -y software-properties-common
sudo add-apt-repository -y ppa:mozillateam/ppa
echo -e "Package: *\nPin: release o=LP-PPA-mozillateam\nPin-Priority: 1001" | sudo tee /etc/apt/preferences.d/mozilla-firefox
sudo apt update && sudo apt install -y tor xvfb xpra firefox-esr

echo "Putting the Tor in the Firefox..."
mkdir -p ~/.mozilla/firefox/torprofile
# AI coded this li'l bit right here
cat << 'EOF' > ~/.mozilla/firefox/torprofile/prefs.js
user_pref("network.proxy.type", 1);
user_pref("network.proxy.socks", "127.0.0.1");
user_pref("network.proxy.socks_port", 9050);
user_pref("network.proxy.socks_version", 5);
user_pref("network.proxy.socks_remote_dns", true);
EOF

echo "Dependencies installed."
# I asked AI to write this little bit, once again apoligies.
read -p "Set alias? [y/n]: " response

if [[ "$response" =~ ^[Yy]$ ]]; then
    if ! grep -q 'alias cstor=' ~/.bashrc; then
        echo 'alias cstor="python3 run.py"' >> ~/.bashrc
        echo "cstor made"
    else
        echo "And why the FUCK did you make this alias beforehand?"
    fi
else
    echo "Fine then... be that way then..."
fi
source ~/.bashrc
