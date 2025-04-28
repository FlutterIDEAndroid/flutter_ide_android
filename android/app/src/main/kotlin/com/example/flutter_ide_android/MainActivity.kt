package com.example.flutter_ide_android

import java.io.File
import java.io.IOException
import java.io.FileInputStream
import java.io.BufferedReader
import java.io.InputStreamReader
import androidx.lifecycle.Observer
import com.termux.app.TermuxInstaller
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import android.content.ServiceConnection
import kotlinx.coroutines.launch
import android.view.View
import android.util.Log
import android.content.Intent
import android.os.Bundle
import androidx.activity.result.contract.ActivityResultContracts
import androidx.activity.result.ActivityResult
import androidx.appcompat.app.AlertDialog
import androidx.core.text.HtmlCompat
//import androidx.drawerlayout.widget.DrawerLayout.DrawerListener
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentActivity
import androidx.viewpager2.widget.ViewPager2.OnPageChangeCallback
import androidx.appcompat.app.AppCompatActivity
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import com.termux.shared.models.ExecutionCommand
import android.net.Uri
import android.content.ContentResolver
import android.database.Cursor
import io.flutter.embedding.android.FlutterFragmentActivity
class MainActivity: FlutterActivity(){
   private val CHANNEL = "flutter_ide_android"
     override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
       instalBootStrap()
    }
     override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
        when (call.method) {
            "installBootstrap" -> {
                instalBootStrap()
                result.success(null)
            }
            "getUsrPath" -> {
                    // Recupera o restante do path passado pelo Flutter
                   
                    val fullPath = "/data/data/${applicationContext.packageName}/files/usr"
                    result.success(fullPath)
                }
             "getBinPath" -> {
                    // Recupera o restante do path passado pelo Flutter
                   
                    val fullPath = "/data/data/${applicationContext.packageName}/files/usr"
                    result.success(fullPath)
                }
             "getLibPath" -> {
                    // Recupera o restante do path passado pelo Flutter
                   
                    val fullPath = "/data/data/${applicationContext.packageName}/files/lib"
                    result.success(fullPath)
                }
             "getHomePath" -> {
                    // Recupera o restante do path passado pelo Flutter
                   
                    val fullPath = "/data/data/${applicationContext.packageName}/files/home"
                    result.success(fullPath)
                }
          
            else -> {
                result.notImplemented()
            }
        }
    }
 }
    
    private fun instalBootStrap() {
      TermuxInstaller.setupIfNeeded(this) {
    }
  }
   private fun getFlutterPath(): String {
        val basePath = "/data/data/${applicationContext.packageName}/files/usr/opt/flutter/bin/cache/dart-sdk"
        return basePath
        
    }
}
