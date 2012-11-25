package com.b50.hoproll;

import android.app.Activity;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager.NameNotFoundException;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.widget.TextView;

public class AboutHopRoll extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.about);
		Log.d("HopRoll", "onCreate for About");
		textViewFor(R.id.about_name).setText("Hop Roll");
		textViewFor(R.id.about_version).setText("version: " + this.getVersion());
		textViewFor(R.id.about_copyright).setText("Copyright Beacon50, LLC");
		textViewFor(R.id.about_contact).setText("@beacon50 on Twitter");
		textViewFor(R.id.about_message).setText(
				"Thank you for using Hop Roll! Please leave feedback!");
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		MenuInflater inflator = this.getMenuInflater();
		inflator.inflate(R.menu.back, menu);
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		switch (item.getItemId()) {
		case R.id.back:
			this.finish();
			return true;
		default:
			return super.onOptionsItemSelected(item);
		}
	}

	private String getVersion() {
		try {
			PackageInfo pInfo = getPackageManager().getPackageInfo(
					getPackageName(), 0);
			return pInfo.versionName;
		} catch (NameNotFoundException e) {
			e.printStackTrace();
			return "1.1";
		}

	}

	private TextView textViewFor(int id) {
		return (TextView) findViewById(id);
	}
}
