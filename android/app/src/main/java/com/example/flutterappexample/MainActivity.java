package com.example.flutterappexample;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;
import android.os.Bundle;
import android.os.PersistableBundle;
import android.util.Log;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import gps.GPSMudules;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.MethodCall;
import path.PathProviderPlugin;







public class MainActivity extends FlutterActivity {
    private static final String BATTERY_CHANNEL = "samples.flutter.io/battery";
    private static final String DEVK = "com.example.flutterappexample/devk";

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState, @Nullable PersistableBundle persistentState) {
        super.onCreate(savedInstanceState, persistentState);
    }

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        new MethodChannel(flutterEngine.getDartExecutor(), BATTERY_CHANNEL).setMethodCallHandler(
            new MethodCallHandler() {
                @Override
                public void onMethodCall(MethodCall call, Result result) {
                    if (call.method.equals("getBatteryLevel")) {
                        int batteryLevel = getBatteryLevel();
                        if (batteryLevel != -1) {
                            result.success(batteryLevel);
                        } else {
                            result.error("UNAVAILABLE", "Battery level not available.", null);
                        }
                    } else {
                        result.notImplemented();
                    }
                }
            }
        );
        new MethodChannel(flutterEngine.getDartExecutor(), DEVK).setMethodCallHandler(
            new MethodChannel.MethodCallHandler() {
                @Override
                public void onMethodCall(MethodCall call, MethodChannel.Result result) {
                    if (call.method.equals("senData")) {
                        startActivity(new Intent(getApplicationContext(), ScreenTestActivity.class));
                    } else {
                        result.notImplemented();
                    }
                }
            }
        );

        flutterEngine.getPlugins().add(new GPSMudules(getApplicationContext()));
        flutterEngine.getPlugins().add(new PathProviderPlugin(getApplicationContext()));
    }
    private int getBatteryLevel() {
        if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
            Log.e("DEVK", "Quoc Khanh 1");
            BatteryManager batteryManager = (BatteryManager) getSystemService(BATTERY_SERVICE);
            return batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
        } else {
            Intent intent = new ContextWrapper(getApplicationContext()).registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
            return (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
        }
    }
}