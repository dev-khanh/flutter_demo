package path;

import android.content.Context;
import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;
import android.util.Log;

import androidx.annotation.NonNull;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.util.PathUtils;

public class PathProviderPlugin implements FlutterPlugin, MethodCallHandler {
  private static final String DEVK_PATH = "plugins.flutter.io/devk_path_provider";
  private PathProviderPlugin handler;
  private MethodChannel methodChannel;
  private Context mContextApplicaition;
  public PathProviderPlugin(Context mContext) {
    mContextApplicaition = mContext;
  }
  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
    methodChannel = new MethodChannel(binding.getBinaryMessenger(), DEVK_PATH);
    handler = new PathProviderPlugin(mContextApplicaition);
    methodChannel.setMethodCallHandler(handler);
  }
  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    methodChannel.setMethodCallHandler(null);
    methodChannel = null;
  }
  @Override
  public void onMethodCall(MethodCall call, @NonNull Result result) {
    switch (call.method) {
      case "getTemporaryDirectory":
        result.success(getPathProviderTemporaryDirectory());
        break;
      case "getApplicationDocumentsDirectory":
        result.success(getPathProviderApplicationDocumentsDirectory());
        break;
      case "getStorageDirectory":
        result.success(getPathProviderStorageDirectory());
        break;
      case "getExternalCacheDirectories":
        result.success(getPathProviderExternalCacheDirectories());
        break;
      case "getExternalStorageDirectories":
        final Integer type = call.argument("type");
        final String directoryName = StorageDirectoryMapper.androidType(type);
        result.success(getPathProviderExternalStorageDirectories(directoryName));
        break;
      case "getApplicationSupportDirectory":
        result.success(getApplicationSupportDirectory());
        break;
      default:
        result.notImplemented();
    }
  }
  private String getPathProviderTemporaryDirectory() {
    return mContextApplicaition.getCacheDir().getPath();
  }
  private String getApplicationSupportDirectory() {
    return PathUtils.getFilesDir(mContextApplicaition);
  }
  private String getPathProviderApplicationDocumentsDirectory() {
    Log.e("DEVK: ",PathUtils.getDataDirectory(mContextApplicaition));
    return PathUtils.getDataDirectory(mContextApplicaition);
  }
  private String getPathProviderStorageDirectory() {
    final File dir = mContextApplicaition.getExternalFilesDir(null);
    if (dir == null) {
      return null;
    }
    return dir.getAbsolutePath();
  }
  private List<String> getPathProviderExternalCacheDirectories() {
    final List<String> paths = new ArrayList<>();
    if (VERSION.SDK_INT >= VERSION_CODES.KITKAT) {
      for (File dir : mContextApplicaition.getExternalCacheDirs()) {
        if (dir != null) {
          paths.add(dir.getAbsolutePath());
        }
      }
    } else {
      File dir = mContextApplicaition.getExternalCacheDir();
      if (dir != null) {
        paths.add(dir.getAbsolutePath());
      }
    }
    return paths;
  }
  private List<String> getPathProviderExternalStorageDirectories(String type) {
    final List<String> paths = new ArrayList<>();
    if (VERSION.SDK_INT >= VERSION_CODES.KITKAT) {
      for (File dir : mContextApplicaition.getExternalFilesDirs(type)) {
        if (dir != null) {
          paths.add(dir.getAbsolutePath());
        }
      }
    } else {
      File dir = mContextApplicaition.getExternalFilesDir(type);
      if (dir != null) {
        paths.add(dir.getAbsolutePath());
      }
    }
    return paths;
  }
}
