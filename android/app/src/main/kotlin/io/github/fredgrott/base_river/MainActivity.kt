package io.github.fredgrott.base_river

// added this import as
import android.graphics.Color
import android.os.Build
import android.view.WindowManager
import androidx.annotation.RequiresApi
import androidx.core.view.WindowCompat
import io.flutter.embedding.android.FlutterActivity

// per how to do it for KitKat and modified for everything past Kitkat per
// https://stackoverflow.com/questions/29069070/completely-transparent-status-bar-and-navigation-bar-on-lollipop
// styles in values-v19 and values-v21 changed per doc
class MainActivity: FlutterActivity() {
    //add the following block of code
    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    override fun onPostResume() {
        super.onPostResume()
        WindowCompat.setDecorFitsSystemWindows(window, false)
        window.navigationBarColor = 0 //for transparent nav bar
        window.statusBarColor = 0 //for transparent status bar

        // says that windows subsystem will draw backgrounds based on the
        // theme settings thus makred transparent becoes transparent
        window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS)
        //window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS)
        //window.addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_NAVIGATION)
        // this goofs up layout at bottom system nav
        // window.addFlags(WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS)
        // this is no appbar
        // window.addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_NAVIGATION)

        // these replace depreciated
        //window.clearFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS)
        //window.addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_NAVIGATION)
        window.statusBarColor(Color.TRANSPARENT)
        window.setNavigationBarColor(Color.TRANSPARENT);

    }
}

private operator fun Int.invoke(transparent: Int) {

}
