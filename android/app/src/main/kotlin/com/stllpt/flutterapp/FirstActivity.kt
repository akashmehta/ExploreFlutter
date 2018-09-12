package com.stllpt.flutterapp

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.widget.Button

/**
 * Created by stllpt031 on 11/9/18.
 */
class FirstActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_first)
        findViewById<Button>(R.id.btnSwitch).setOnClickListener {
            val intent = Intent(FirstActivity@ this, MainActivity::class.java)
            intent.putExtra(Intent.EXTRA_TEXT, "hello world")
            intent.action = Intent.ACTION_SEND
            intent.type = "text/plain"
            startActivity(intent)
        }
    }
}