git clone https://github.com/Nilsu11/android_packages_apps_OmniClock.git -b 10 ~/modLOS/OmniClock
git clone https://github.com/Nilsu11/android_packages_apps_OmniClock.git -b gradle ~/modLOS/OmniClock/gradle
sed -i 's/org.omnirom.deskclock.R.animator.fade/org.omnirom.deskclock.R.anim.abc_fade/' ~/modLOS/OmniClock/src/org/omnirom/deskclock/widget/ActionableToastBar.java
sed -i 's/public class AlarmClockFragment extends DeskClockFragment implements/public abstract class AlarmClockFragment extends DeskClockFragment implements/' ~/modLOS/OmniClock/src/org/omnirom/deskclock/AlarmClockFragment.java
sed -i '/@Override/d' ~/modLOS/OmniClock/src/org/omnirom/deskclock/AlarmClockFragment.java
sed -i '/import org.omnirom.deskclock.R;/d' ~/modLOS/OmniClock/src/org/omnirom/deskclock/worldclock/AddCityCialog.java
sed -i '/import org.omnirom.deskclock.R;/d' ~/modLOS/OmniClock/src/org/omnirom/deskclock/AlarmPluginFactory.java
sed -i '/import org.omnirom.deskclock.R;/d' ~/modLOS/OmniClock/src/org/omnirom/deskclock/Utils.java
sed -i '/package/a import org.omnirom.deskclock.R;' ~/modLOS/OmniClock/src/org/omnirom/deskclock/**.java
sed -i '/package/a import org.omnirom.deskclock.R;' ~/modLOS/OmniClock/src/org/omnirom/deskclock/**/**.java
sed -i '/import org.omnirom.deskclock.R;/d' ~/modLOS/OmniClock/src/org/omnirom/deskclock/widget/SlidingTabStrip.java
sed -i 's/final TimePickerDialog timePickerFragment/TimePickerDialog timePickerFragment/' ~/modLOS/OmniClock/src/org/omnirom/deskclock/AlarmUtils.java
