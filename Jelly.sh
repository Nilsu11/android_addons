git clone https://github.com/lineageos/android_packages_apps_jelly.git ~/modLOS/Jelly
wget -O ~/modLOS/Jelly/adblock/adaway.txt https://raw.githubusercontent.com/AdAway/adaway.github.io/master/hosts.txt
wget -O ~/modLOS/Jelly/adblock/quarks.txt https://raw.githubusercontent.com/CarbonROM/android_packages_apps_Quarks/cr-7.0/app/src/main/res/raw/hosts.txt
wget -O ~/modLOS/Jelly/adblock/jquarks.txt https://gitlab.com/oF2pks/jelly/-/raw/jQuarksMore/app/src/main/res/raw/hosts.txt?inline=false
sed -i '/#/d' ~/modLOS/Jelly/adblock/adaway.txt
sed -i '/localhost/d' ~/modLOS/Jelly/adblock/adaway.txt
sed -i 's/127.0.0.1 //' ~/modLOS/Jelly/adblock/adaway.txt
sed -i 's/::1 //' ~/modLOS/Jelly/adblock/adaway.txt
sed -i '/^$/d' ~/modLOS/Jelly/adblock/adaway.txt
paste -d '\n' ~/modLOS/Jelly/adblock/adaway.txt ~/modLOS/Jelly/adblock/quarks.txt ~/modLOS/Jelly/adblock/jquarks.txt > ~/modLOS/Jelly/app/src/main/res/raw/hosts.txt
awk '!seen[$0]++' ~/modLOS/Jelly/app/src/main/res/raw/hosts.txt
wget -O ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/utils/AdBlocker.java https://raw.githubusercontent.com/CarbonROM/android_packages_apps_Quarks/cr-7.0/app/src/main/java/org/carbonrom/quarks/utils/AdBlocker.java
sed -i "s/org.carbonrom.quarks/org.lineageos.jelly/g" ~/modLOS/Jelly/app/src/main/res/mipmap-anydpi/ic_launcher.xml
sed -i '/package/a import org.lineageos.jelly.utils.AdBlocker' ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/utils/AdBlocker.java
sed -i '/PrefsUtils.getHomePage/a AdBlocker.init(this)' ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/MainActivity.kt
sed -i '/object/a     private const val KEY_ADBLOCKER = "key_adblocker"' ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/utils/PrefsUtils.kt
sed '$d' ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/utils/PrefsUtils.kt
echo '    fun getAdBlocker(context: Context?): Boolean {' >> ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/utils/PrefsUtils.kt
echo '        val prefs = PreferenceManager.getDefaultSharedPreferences(context)' >> ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/utils/PrefsUtils.kt
echo '        return prefs.getBoolean(KEY_ADBLOCKER, true)' >> ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/utils/PrefsUtils.kt
echo '}' >> ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/utils/PrefsUtils.kt
echo '}' >> ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/utils/PrefsUtils.kt
sed -i '/android.webkit/d' ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/webview/WebClient.kt
sed -i '/package/a android.webkit.*' ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/webview/WebClient.kt
sed -i 'android.webkit.*/a import org.lineageos.jelly.utils.AdBlocker' ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/webview/WebClient.kt
sed -i 'import org.lineageos.jelly.utils.AdBlocker/a import org.lineageos.jelly.utils.PrefsUtils' ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/webview/WebClient.kt
sed -i 'internal class WebClient(private val mUrlBarController: UrlBarController) : WebViewClient() {/a     private val loadedUrls: MutableMap<String, Boolean> = HashMap()' ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/webview/WebClient.kt
sed '$d' ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/webview/WebClient.kt
echo 'override fun shouldInterceptRequest(view: WebView, request: WebResourceRequest): WebResourceResponse? {' >> ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/webview/WebClient.kt
echo '        val ad: Boolean' >> ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/webview/WebClient.kt
echo '        if (!PrefsUtils.getAdBlocker(view.context)) return super.shouldInterceptRequest(view, request)' >> ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/webview/WebClient.kt
echo '        val url = request.url.toString()' >> ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/webview/WebClient.kt
echo '        if (!loadedUrls.containsKey(url)) {' >> ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/webview/WebClient.kt
echo '            ad = AdBlocker.isAd(url)' >> ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/webview/WebClient.kt
echo '            loadedUrls.put(url, ad)' >> ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/webview/WebClient.kt
echo '        } else {' >> ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/webview/WebClient.kt
echo '            ad = loadedUrls[url]!!' >> ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/webview/WebClient.kt
echo '        }' >> ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/webview/WebClient.kt
echo '        return if (ad) AdBlocker.createEmptyResource() else super.shouldInterceptRequest(view, request)' >> ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/webview/WebClient.kt
echo '    }' >> ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/webview/WebClient.kt
echo'}' >> ~/modLOS/Jelly/app/src/main/java/org/lineageos/jelly/webview/WebClient.kt
sed '$d' ~/modLOS/Jelly/app/src/main/res/values/strings.xml
echo '    <!-- Settings: adblocker title -->' >> ~/modLOS/Jelly/app/src/main/res/values/strings.xml
echo '    <string name="pref_adblocker_title">Adblocker</string>' >> ~/modLOS/Jelly/app/src/main/res/values/strings.xml
echo '    <!-- Settings: adblocker summary -->' >> ~/modLOS/Jelly/app/src/main/res/values/strings.xml
echo '    <string name="pref_adblocker_summary">Block advertisements while browsing</string>' >> ~/modLOS/Jelly/app/src/main/res/values/strings.xml
echo '</resources>' >> ~/modLOS/Jelly/app/src/main/res/values/strings.xml
sed "/'android:title="@string/pref_save_form_data_title"'/a '        <SwitchPreference android:defaultValue="1" android:key="key_adblocker" android:summary="@string/pref_adblocker_summary" android:title="@string/pref_adblocker_title" />'" ~/modLOS/Jelly/app/src/main/res/xml/settings.xml
