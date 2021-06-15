package au.com.rs.plugins;

import android.annotation.TargetApi;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.util.Log;
import android.webkit.WebResourceRequest;
import android.webkit.WebView;
import android.webkit.WebViewClient;

public class SpaWebViewClient extends WebViewClient {


    @SuppressWarnings("deprecation") // deprecated in API 24
    @Override
    public boolean shouldOverrideUrlLoading(WebView view, String url){
        final Uri uri = Uri.parse(url);
        return handleUriForOverride(view, uri);
    }

    /**
     * A method to check if the url requested should be overridden,
     * or if loading should be diverted to the default browser
     * instead
     *
     * Introduced in API 24
     */
    @TargetApi(Build.VERSION_CODES.N)
    @Override
    public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request){

        return handleUriForOverride(view, request.getUrl());

        // https://developer.android.com/guide/webapps/webview

/*
       if ("www.example.com".equals(request.getUrl().getHost())) {
           // This is my website, so do not override; let my WebView load the page
           return false;
       }
       // Otherwise, the link is not for a page on my site, so launch another Activity that handles URLs
       Intent intent = new Intent(Intent.ACTION_VIEW, request.getUrl());
       startActivity(intent);
       return true; */
   }

   private boolean handleUriForOverride(WebView view, final Uri uri) {

        Log.d("*** handle", uri.toString());

       final String host = uri.getHost();
       final String scheme = uri.getScheme();

       Log.d("*** handle", host);
       Log.d("*** scheme", scheme);

       if ((scheme.equals("file")) & uri.getPath().startsWith("/android_asset")){ // use url encode for '/android-asset'
           Log.d("*** local file", host);
           return false;
       }

       Intent intent = new Intent(Intent.ACTION_VIEW, uri);
       view.getContext().startActivity(intent);
       return true;
   }
}
