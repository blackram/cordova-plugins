package au.com.rs.plugins;

import android.app.Activity;
import android.os.Bundle;
import android.widget.TextView;

public class SpaActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        String package_name = getApplication().getPackageName();

        int layout_id = getApplication().getResources().getIdentifier("activity_new", "layout", package_name);

        setContentView(layout_id);

        int text_id = getApplication().getResources().getIdentifier("textView", "id", package_name);
        TextView textView = (TextView) findViewById(text_id);

        Bundle b = getIntent().getExtras();

        if (b == null) {
            textView.setText("no message was passed");
            return;
        }

        textView.setText(b.getString("Message") + " from plugin");

    }
}