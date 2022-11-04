git clone https://github.com/lineageos/android_packages_apps_jelly.git ~/modLOS/Jelly
wget -O ~/modLOS/Jelly/adblock/adaway.txt https://raw.githubusercontent.com/AdAway/adaway.github.io/master/hosts.txt
wget -O ~/modLOS/Jelly/adblock/quarks.txt https://raw.github.com/CarbonROM/android_packages_apps_Quarks/cr-7.0/app/src/main/res/raw/hosts.txt
wget -O ~/modLOS/Jelly/adblock/jquarks.txt https://gitlab.com/oF2pks/jelly/-/raw/jQuarksMore/app/src/main/res/raw/hosts.txt?inline=false
sed -i '/#/d' ~/modLOS/Jelly/adblock/adaway.txt
sed -i '/localhost/d' ~/modLOS/Jelly/adblock/adaway.txt
sed 's/127.0.0.1 //' ~/modLOS/Jelly/adblock/adaway.txt
sed 's/::1 //' ~/modLOS/Jelly/adblock/adaway.txt
sed '/^$/d' ~/modLOS/Jelly/adblock/adaway.txt
paste -d '\n' ~/modLOS/Jelly/adblock/adaway.txt ~/modLOS/Jelly/adblock/quarks.txt ~/modLOS/Jelly/adblock/jquarks.txt > ~/modLOS/Jelly/app/src/main/res/raw/hosts.txt
