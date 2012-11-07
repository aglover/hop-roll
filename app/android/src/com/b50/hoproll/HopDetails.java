package com.b50.hoproll;

import com.b50.hoproll.R;

import android.app.Activity;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.util.Log;
import android.widget.TextView;

public class HopDetails extends Activity {
	private long hopId;
	private TextView hopName;
	private TextView hopAlpha;
	private TextView hopDesc;
	private TextView hopSubs;

	@Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.hop_details);
        
        hopId = getIntent().getLongExtra("hop_id", 0);
        SQLiteDatabase db = (new DatabaseHelper(this)).getWritableDatabase();
        Cursor cursor = db.rawQuery("SELECT * FROM hops WHERE _id = ?", new String[]{Long.valueOf(hopId).toString()});
        if (cursor != null){
            cursor.moveToFirst();
            Log.d("hops", "values for name " + cursor.getString(cursor.getColumnIndex("name")));
            
            hopName = (TextView) findViewById(R.id.hopName);
            hopName.setText(cursor.getString(cursor.getColumnIndex("name")));
            
            hopAlpha = (TextView) findViewById(R.id.alpha);
            hopAlpha.setText("Alpha acid: " + cursor.getString(cursor.getColumnIndex("alpha_acid")) + "%");
            
            hopDesc = (TextView) findViewById(R.id.description);
            hopDesc.setText(cursor.getString(cursor.getColumnIndex("description")));
            
            hopSubs = (TextView) findViewById(R.id.substitutions);
            hopSubs.setText("Possible substitutions: " + cursor.getString(cursor.getColumnIndex("substitutions")));
            //then you can close it
            cursor.close();
        }
        Log.d("hops", "done");
	}
}
