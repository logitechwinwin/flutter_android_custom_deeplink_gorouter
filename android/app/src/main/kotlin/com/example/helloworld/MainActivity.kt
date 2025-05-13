package com.voice.hello

import io.flutter.embedding.android.FlutterActivity
import android.content.Intent
import android.os.Bundle
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.voice.hello/gemini" 

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        flutterEngine?.let { engine ->
            MethodChannel(engine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
                if (call.method == "openSecondPage") {
                    val parameter = call.argument<String>("parameter")
                    openSecondPage(parameter)
                    result.success("openSecondPage() was called")  // Return a result to confirm the method was invoked
                } else {
                    result.notImplemented()
                }
            }
        } ?: run {
            // If flutterEngine is null, print a log or handle error
            print("Error: Flutter engine is not initialized.")
        }
    }

    // Function to open the second page with parameters
    private fun openSecondPage(parameter: String?) {
  //      val intent = Intent(this, SecondActivity::class.java)
  //      intent.putExtra("parameter", parameter)
  //      startActivity(intent)
        print("Here is openSecondPage() in");
    }

}
