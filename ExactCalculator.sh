git clone https://github.com/LineageOS/android_packages_apps_ExactCalculator.git ~/modLOS/ExactCalculator
git clone https://github.com/Nilsu11/ExactCalcGradle.git ~/modLOS/ExactCalculator/gradle
sed -i '/package/a import org.lineageos.calculator2.R;' android_packages_apps_ExactCalculator/src/com/android/calculator2/**.java
git clone https://android.googlesource.com/platform/external/crcalc ~/modLOS/ExactCalculator/crcalc
cp -f calcb.xml ~/modLOS/ExactCalculator/res/drawable/ic_launcher_background.xml
cp -f calcf.xml ~/modLOS/ExactCalculator/res/drawable/ic_launcher_foreground.xml
sed -i 's/com.android.calculator2/org.lineageos.calculator2/' ~/modLOS/ExactCalculator/gradle/build.gradle
