sed -i "s/'    <background android:drawable="@color/ic_launcher_background" />'/'    <background android:drawable="@color/ic_background" />'/g" ~/modLOS/Aperture/app/src/main/res/mipmap-anydpi/ic_launcher.xml
sed -i "s/'@drawable/ic_launcher_monochrome'/'@drawable/ic_launcher_foreground'/g" ~/Aperture/app/src/main/res/mipmap-anydpi/ic_launcher.xml
cp -f camera.xml ~/modLOS/Aperture/app/src/main/res/drawable/ic_launcher_foreground.xml
sed -i '$d' ~/modLOS/Aperture/app/src/main/res/values/colors.xml
echo '    <color name="ic_background">#68be6c</color>' >> ~/modLOS/Aperture/app/src/main/res/values/colors.xml
echo '</resources>' >> ~/modLOS/Aperture/app/src/main/res/values/colors.xml