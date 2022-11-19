sed -i "s/'@drawable/ic_launcher_monochrome'/'@drawable/ic_launcher_foreground'/g" ~/modLOS/Eleven/res/mipmap-anydpi/ic_launcher.xml
sed -i "s/'    <background android:drawable="@drawable/ic_launcher_background" />'/'    <background android:drawable="@color/ic_background" />'/g" ~/modLOS/Eleven/res/mipmap-anydpi/ic_launcher.xml
sed -i '$d' ~/modLOS/Eleven/res/values/colors.xml
echo '    <color name="ic_background">#2A3232</color>' >> ~/modLOS/Eleven/res/values/colors.xml
echo '</resources>' >> ~/modLOS/Eleven/res/values/colors.xml
cp -f ~/modLOS/android_addons/icons/musicf.xml ~/modLOS/Eleven/res/drawable/ic_launcher_foreground.xml
