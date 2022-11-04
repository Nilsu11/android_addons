git clone https://github.com/lineageos/android_packages_apps_jelly.git ~/modLOS/Jelly
wget -O ~/modLOS/Jelly/adblock/adaway https://adaway.org/hosts.txt
wget -O ~/modLOS/Jelly/adblock/quarks https://raw.github.com/CarbonROM/android_packages_apps_Quarks/cr-7.0/app/src/main/res/raw/hosts.txt
wget -O ~/modLOS/Jelly/adblock/jquarks https://gitlab.com/oF2pks/jelly/-/raw/jQuarksMore/app/src/main/res/raw/hosts.txt?inline=false
paste -d '\n' ~/modLOS/Jelly/adblock/adaway ~/modLOS/Jelly/adblock/quarks ~/modLOS/Jelly/adblock/jquarks > /app/src/main/res/raw/hosts.txt
