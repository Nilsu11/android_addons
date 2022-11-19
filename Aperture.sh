git clone https://github.com/LineageOS/android_packages_apps_Aperture.git ~/modLOS/Aperture
sed -i "s/'    <background android:drawable="@drawable/ic_launcher_background" />'/'    <background android:drawable="@color/ic_background" />'/g" ~/modLOS/Aperture/app/src/main/res/mipmap-anydpi/ic_launcher.xml
sed -i "s/'@drawable/ic_launcher_monochrome'/'@drawable/ic_launcher_foreground'/g" ~/modLOS/Aperture/app/src/main/res/mipmap-anydpi/ic_launcher.xml
cp -f ~/modLOS/android_addons/icons/camera.xml ~/modLOS/Aperture/app/src/main/res/drawable/ic_launcher_foreground.xml
cp -f ~/modLOS/android_addons/icons/cameram.xml ~/modLOS/Aperture/app/src/main/res/drawable/ic_launcher_monochrome.xml
sed -i '$d' ~/modLOS/Aperture/app/src/main/res/values/colors.xml
echo '    <color name="ic_background">#2A3232</color>' >> ~/modLOS/Aperture/app/src/main/res/values/colors.xml
echo '</resources>' >> ~/modLOS/Aperture/app/src/main/res/values/colors.xml
