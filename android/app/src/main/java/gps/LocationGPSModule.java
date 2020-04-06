package gps;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.util.Log;

public class LocationGPSModule  {
    public static final String TAG = "DEVK MAIN";
    private LocationUpdatesService mService = null;
    private Context context;
    private Boolean startService = false;
    public LocationGPSModule(Context context) {
        this.context = context;
    }
    public void init() {
        Log.i("DEVK", "Init !!!");
        context.bindService(new Intent(context, LocationUpdatesService.class), mServiceConnection, Context.BIND_AUTO_CREATE);
    }
    private final ServiceConnection mServiceConnection = new ServiceConnection() {
        @Override
        public void onServiceConnected(ComponentName name, IBinder service) {
            LocationUpdatesService.LocalBinder binder = (LocationUpdatesService.LocalBinder) service;
            mService = binder.getService();
            mService.requestLocationUpdates();
            startService = true;
        }
        @Override
        public void onServiceDisconnected(ComponentName name) {
            mService = null;
            startService = false;
        }
    };
    public void start(){
        Log.d("DEVK: ", "Start");
        if(mService != null && !startService){
             Log.i("DEVK", "Start service");
             mService.requestLocationUpdates();
        }
    }
    public void stop(){
        Log.d("DEVK: ", "stop");
        startService = false;
        if(mService != null){
            mService.removeLocationUpdates();
//            Log.i("DEVK", "Stop service");
        }
    }
    public void onStartLifecycle(){
//        Log.i("DEVK", "onStart()");
        startService = false;
        context.bindService(new Intent(context, LocationUpdatesService.class), mServiceConnection, Context.BIND_AUTO_CREATE);
    }
    public void onStopLifecycle(){
        startService = true;
        new ReadTheadStartGPS().start();
    }
    class ReadTheadStartGPS extends Thread {
        @Override
        public void run() {
            while (startService){
                try {
//                    Log.e("DEVK", " Stop()");
                    Thread.sleep(100000);
                    new LocationGPSModule(context).stop();

                    Thread.sleep(102000);
                    new LocationGPSModule(context).start();
//                    Log.e("DEVK", " Start()");
                } catch (Exception e) {
//                    Log.i("DEVK", e.toString());
                }
            }
        }
    }
}
