git clone https://github.com/lineageos/android_packages_apps_jelly.git ~/modLOS/Jelly
wget -O ~/modLOS/Jelly/adblock/adaway.txt https://raw.githubusercontent.com/AdAway/adaway.github.io/master/hosts.txt
wget -O ~/modLOS/Jelly/adblock/quarks.txt https://raw.githubusercontent.com/CarbonROM/android_packages_apps_Quarks/cr-7.0/app/src/main/res/raw/hosts.txt
wget -O ~/modLOS/Jelly/adblock/jquarks.txt https://gitlab.com/oF2pks/jelly/-/raw/jQuarksMore/app/src/main/res/raw/hosts.txt?inline=false
sed -i '/#/d' ~/modLOS/Jelly/adblock/adaway.txt
sed -i '/localhost/d' ~/modLOS/Jelly/adblock/adaway.txt
sed 's/127.0.0.1 //' ~/modLOS/Jelly/adblock/adaway.txt
sed 's/::1 //' ~/modLOS/Jelly/adblock/adaway.txt
sed '/^$/d' ~/modLOS/Jelly/adblock/adaway.txt
paste -d '\n' ~/modLOS/Jelly/adblock/adaway.txt ~/modLOS/Jelly/adblock/quarks.txt ~/modLOS/Jelly/adblock/jquarks.txt > ~/modLOS/Jelly/app/src/main/res/raw/hosts.txt
awk '!seen[$0]++' ~/modLOS/Jelly/app/src/main/res/raw/hosts.txt
wget -O ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/utils/AdBlocker.java https://raw.githubusercontent.com/CarbonROM/android_packages_apps_Quarks/cr-7.0/app/src/main/java/org/carbonrom/quarks/utils/AdBlocker.java
sed -i "s/org.carbonrom.quarks/org.lineageos.jelly/g" ~/modLOS/Aperture/app/src/main/res/mipmap-anydpi/ic_launcher.xml
sed -i '/package/a import org.lineageos.jelly.utils.AdBlocker;' ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/MainActivity.java
PrefsUtils.getHomePage
sed -i '/PrefsUtils.getHomePage/a AdBlocker.init(this);' ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/MainActivity.java
sed -i '/public final class PrefsUtils/a private static final String KEY_ADBLOCKER = "key_adblocker";' ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/utils/PrefsUtils.java
echo 'public static boolean getAdBlocker(Context context) {' >> ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/utils/PrefsUtils.java
echo 'SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(context);' >> ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/utils/PrefsUtils.java
echo 'return prefs.getBoolean(KEY_ADBLOCKER, true);' >> ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/utils/PrefsUtils.java
echo '}' >> ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/utils/PrefsUtils.java
