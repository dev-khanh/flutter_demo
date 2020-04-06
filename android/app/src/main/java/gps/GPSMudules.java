package gps;
import android.content.Context;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class GPSMudules implements FlutterPlugin, MethodChannel.MethodCallHandler{
    private static final String GPS = "plugins.flutter.io/initGPS";
    private GPSMudules handler;
    private MethodChannel methodChannel;
    private Context mContextApplicaition;
    public GPSMudules(Context applicationContext) {
        mContextApplicaition = applicationContext;
    }
    @Override
    public void onAttachedToEngine(FlutterPluginBinding binding) {
        methodChannel = new MethodChannel(binding.getBinaryMessenger(), GPS);
        handler = new GPSMudules(mContextApplicaition);
        methodChannel.setMethodCallHandler(handler);
    }
    @Override
    public void onDetachedFromEngine(FlutterPluginBinding binding) {
        methodChannel.setMethodCallHandler(null);
        methodChannel = null;
    }
    @Override
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        LocationGPSModule locationGPSModule = new LocationGPSModule(mContextApplicaition);
        switch (call.method) {
            case "initGPS":
                locationGPSModule.init();
                result.success(null);
                break;
            case "startGPS":
                locationGPSModule.start();
                break;
            case "stopGPS":
                locationGPSModule.stop();
            default:
                result.notImplemented();
                break;
        }
    }
}
