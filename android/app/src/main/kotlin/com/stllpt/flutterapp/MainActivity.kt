package com.stllpt.flutterapp

import android.content.Intent
import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity() : FlutterActivity() {
    var sharedText: String? = null
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)
        val action = intent.action
        val type = intent.type
        if (Intent.ACTION_SEND == action && type != null) {
            if ("text/plain" == type) {
                handleSendText(intent); // Handle text being sent
            }
        }
        MethodChannel(flutterView, "app.channel.shared.data")
                .setMethodCallHandler { methodCall, result ->
                    methodCall.method?.let {
                        if (it.contentEquals("getSharedText")) {
                            println("sharedText = $sharedText")
                            result.success(sharedText)
                            sharedText = null
                        }
                    }
                }
    }

    private fun handleSendText(intent: Intent) {
        sharedText = intent.getStringExtra(Intent.EXTRA_TEXT)
    }
}