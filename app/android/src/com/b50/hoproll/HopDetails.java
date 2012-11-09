package com.b50.hoproll;

import android.app.Activity;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.widget.TextView;

public class HopDetails extends Activity {

	@Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.hop_details);        
        long  hopId = getIntent().getLongExtra("hop_id", 0);
        SQLiteDatabase db = (new DatabaseHelper(this)).getWritableDatabase();
        Cursor cursor = db.rawQuery("SELECT * FROM hops WHERE _id = ?", new String[]{Long.valueOf(hopId).toString()});
        if (cursor != null){
            cursor.moveToFirst();           
            TextView hopName = textViewFor(R.id.hopName);
            hopName.setText(cursor.getString(cursor.getColumnIndex("name")));
            
            TextView hopAlpha = textViewFor(R.id.alpha);
            hopAlpha.setText("Alpha acid: " + cursor.getString(cursor.getColumnIndex("alpha_acid")) + "%");
            
            TextView hopDesc = textViewFor(R.id.description);
            hopDesc.setText(cursor.getString(cursor.getColumnIndex("description")));
            
            TextView hopSubs = textViewFor(R.id.substitutions);
            hopSubs.setText("Possible substitutions: " + cursor.getString(cursor.getColumnIndex("substitutions")));
            cursor.close();
        }
	}
	
	private TextView textViewFor(int id){
		return (TextView)findViewById(id);
	}
}
