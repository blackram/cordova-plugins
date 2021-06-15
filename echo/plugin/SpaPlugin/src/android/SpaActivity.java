package au.com.rs.plugins;

import android.app.Activity;
import android.os.Bundle;
import android.webkit.WebSettings;
import android.widget.TextView;
import android.webkit.WebView;

public class SpaActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        String package_name = getApplication().getPackageName();

        int layout_id = getApplication().getResources().getIdentifier("activity_new", "layout", package_name);

        setContentView(layout_id);

        ///

        int text_id = getApplication().getResources().getIdentifier("textView", "id", package_name);
        TextView textView = (TextView) findViewById(text_id);

        Bundle b = getIntent().getExtras();

        if (b == null) {
            textView.setText("no message was passed");
            return;
        }

        textView.setText(b.getString("Message") + " from plugin");


        /// this will load the url in an external browser as determined by the host device

        int webView_id = getApplication().getResources().getIdentifier("webView", "id", package_name);
        WebView webView = (WebView) findViewById(webView_id);

        WebSettings webSettings = webView.getSettings();
        webSettings.setJavaScriptEnabled(true);

        webView.setWebViewClient(new SpaWebViewClient());
      //  webView.loadUrl("https://www.google.com.au");

        webView.loadUrl("file:///assets/www/sites/o2/index.html");

    }
}