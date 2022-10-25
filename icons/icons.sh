sed -i "s/'    <background android:drawable="@color/ic_launcher_background" />'/'    <background android:drawable="@color/ic_background" />'/g" ic_launchercamera
sed -i "s/'@drawable/ic_launcher_monochrome'/'@drawable/ic_launcher_foreground'/g" ic_launchercamera
cp -f camera.xml acl
