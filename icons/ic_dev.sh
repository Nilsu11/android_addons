sed -i "s/'    <background android:drawable="@drawable/ic_launcher_background" />'/'    <background android:drawable="@color/ic_background" />'/g" ~/modLOS/Aperture/app/src/main/res/mipmap-anydpi/ic_launcher.xml
sed -i "s/'@drawable/ic_launcher_monochrome'/'@drawable/ic_launcher_foreground'/g" ~/modLOS/Aperture/app/src/main/res/mipmap-anydpi/ic_launcher.xml
cp -f camera.xml ~/modLOS/Aperture/app/src/main/res/drawable/ic_launcher_foreground.xml
sed -i '$d' ~/modLOS/Aperture/app/src/main/res/values/colors.xml
echo '    <color name="ic_background">#68be6c</color>' >> ~/modLOS/Aperture/app/src/main/res/values/colors.xml
echo '</resources>' >> ~/modLOS/Aperture/app/src/main/res/values/colors.xml
cp -f musicb.xml ~/modLOS/Eleven/res/drawable/ic_launcher_background.xml
cp -f musicf.xml ~/modLOS/Eleven/res/drawable/ic_launcher_foreground.xml
cp -f recorderf.xml ~/modLOS/Recorder/app/src/main/res/drawable/ic_launcher_foreground.xml
cp -f recorderb.xml ~/modLOS/Recorder/app/src/main/res/drawable/ic_launcher_background.xml
cp -f etar.xml ~/modLOS/Etar/app/src/main/res/drawable/ic_launcher_background.xml
