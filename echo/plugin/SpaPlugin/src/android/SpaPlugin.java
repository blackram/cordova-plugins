package au.com.rs.plugins;

import android.content.Context;
import android.content.Intent;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.CordovaInterface;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * This class echoes a string called from JavaScript.
 */
public class SpaPlugin extends CordovaPlugin {

    public void initialize(CordovaInterface cordova, CordovaWebView webView) {
        super.initialize(cordova, webView);
    }
    
    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        Context context = cordova.getActivity().getApplicationContext();

        if(action.equals("launch")) {

            String passedMessage = args.optString(0);
            String message = (passedMessage == null) ? "no message passed" : passedMessage;
            this.openNewActivity(context, message);

            return true;
        }

        return false;
    }

    private void openNewActivity(Context context, String message) {
        Intent intent = new Intent(context, SpaActivity.class);
        intent.putExtra("Message", message);
        this.cordova.getActivity().startActivity(intent);
    }

    /* left in-place for debugging sanity
    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
          if (action.equals("launch")) {
            String message = args.getString(0);
            this.coolMethod(message, callbackContext);
            return true;
        } 
        return false;
    }

    private void coolMethod(String message, CallbackContext callbackContext) {
        if (message != null && message.length() > 0) {
            callbackContext.success(message);
        } else {
            callbackContext.error("Expected one non-empty string argument.");
        }
    }
    */

}
