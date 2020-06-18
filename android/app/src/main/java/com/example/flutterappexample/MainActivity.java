package com.example.flutterappexample;

import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;
import android.util.Log;
import androidx.annotation.NonNull;
import com.example.flutterappexample.momo.AppMoMoLib;
import com.example.flutterappexample.momo.MoMoParameterNamePayment;
import java.util.HashMap;
import java.util.Map;
import gps.GPSMudules;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugins.GeneratedPluginRegistrant;
import path.PathProviderPlugin;
import static com.example.flutterappexample.momo.PaygateModules.paygate;
public class MainActivity extends FlutterActivity {
    private static final String BATTERY_CHANNEL = "samples.flutter.io/battery";
    private static final String DEVK = "com.example.flutterappexample/devk";
    private static final String momo = "com.example.flutterappexample/MomoPlugin";
    MethodChannel.Result token;
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
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

        new MethodChannel(flutterEngine.getDartExecutor(), momo).setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
                        final String partnerRefId = call.argument("partnerRefId");
                        final String partnerTransId = call.argument("partnerTransId");
                        final String amount = call.argument("amount");
                        final String description = call.argument("description");
                        switch (call.method) {
                            case "hashRSA":
                                AppMoMoLib.getInstance().setEnvironment(AppMoMoLib.ENVIRONMENT.DEVELOPMENT);
                                String hashRSA = paygate(partnerRefId, partnerTransId, Long.parseLong(amount), description, MoMoParameterNamePayment.publickeyMoMo);
                                result.success(hashRSA);
                                break;
                            case "Start":
                                AppMoMoLib.getInstance().setEnvironment(AppMoMoLib.ENVIRONMENT.DEVELOPMENT);
                                requestPayment(Long.parseLong(amount), description);
                                token = result;
                                break;
                            default:
                                result.notImplemented();
                                break;
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
    private void requestPayment(long amount, String descripion) {
        AppMoMoLib.getInstance().setAction(AppMoMoLib.ACTION.PAYMENT);
        AppMoMoLib.getInstance().setActionType(AppMoMoLib.ACTION_TYPE.GET_TOKEN);
        Map<String, Object> eventValue = new HashMap<>();
        eventValue.put(MoMoParameterNamePayment.ACTION, MoMoParameterNamePayment.GETTOKEN);
        eventValue.put(MoMoParameterNamePayment.PARTNER, MoMoParameterNamePayment.MERCHANT);
        eventValue.put(MoMoParameterNamePayment.APPSCHEME, MoMoParameterNamePayment.MMOSIJI);
        eventValue.put(MoMoParameterNamePayment.AMOUNT, amount);
        eventValue.put(MoMoParameterNamePayment.DESCRIPTION, descripion);
        eventValue.put(MoMoParameterNamePayment.MERCHANT_CODE, MoMoParameterNamePayment.MOMOISJ_NAME);
        eventValue.put(MoMoParameterNamePayment.MERCHANT_NAME, MoMoParameterNamePayment.NAMECOTY);
        AppMoMoLib.getInstance().requestMoMoCallBack(this, eventValue);
    }
    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if(requestCode == AppMoMoLib.getInstance().REQUEST_CODE_MOMO && resultCode == -1) {
            if(data != null) {
                if(data.getIntExtra("status", -1) == 0) {
                    Log.e("DEVK", "message: " + "Get token " + data.getStringExtra("message"));
                    if(data.getStringExtra("data") != null && !data.getStringExtra("data").equals("")) {
//                        Log.d("DEVK", data.getStringExtra("data"));
                        token.success(data.getStringExtra("data"));
                    } else {
                        Log.e("DEVK", "message: " + "Không nhận được thông tin");
                    }
                } else if(data.getIntExtra("status", -1) == 1) {
                    String message = data.getStringExtra("message") != null?data.getStringExtra("message"):"Thất bại";
                    Log.d("DEVK", "message: " + message);
                } else if(data.getIntExtra("status", -1) == 2) {
                    Log.e("DEVK","message: " + "Không nhận được thông tin");
                } else {
                    Log.d("DEVK", "message: " + "Không nhận được thông tin");
                }
            } else {
                Log.e("DEVK", "message: " + "Không nhận được thông tin");
            }
        } else {
            Log.d("DEVK", "message: " + "Không gởi được yêu cầu vui lòng kiểm tra lại");
        }
    }
}