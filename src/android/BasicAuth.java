package tkou15.cordova.plugins.BasicAuth;

import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.ICordovaHttpAuthHandler;


public class BasicAuth extends CordovaPlugin {
  private String mBasicAuthUser = "";
  private String mBasicAuthPass = "";

  @Override
  public void initialize(CordovaInterface cordova, CordovaWebView webView) {
    super.initialize(cordova, webView);
    this.mBasicAuthUser = preferences.getString("BasicAuthUser", "");
    this.mBasicAuthPass = preferences.getString("BasicAuthPass", "");
  }

  @Override
  public boolean onReceivedHttpAuthRequest(CordovaWebView view, ICordovaHttpAuthHandler handler, String host, String realm) {
    handler.proceed(mBasicAuthUser, mBasicAuthPass);
    return super.onReceivedHttpAuthRequest(view, handler, host, realm);
  }
}
