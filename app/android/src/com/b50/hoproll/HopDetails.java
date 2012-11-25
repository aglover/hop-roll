package com.b50.hoproll;

import android.app.Activity;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.widget.TextView;

public class HopDetails extends Activity {
	protected Cursor cursor;
	protected SQLiteDatabase db;
	
	@Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.hop_details);        
        long  hopId = getIntent().getLongExtra("hop_id", 0);
        this.db = (new DatabaseHelper(this)).getWritableDatabase();
        
        DatabaseHelper.cleanupCurosr(this.cursor);
        
        cursor = db.rawQuery("SELECT * FROM hops WHERE _id = ?", new String[]{Long.valueOf(hopId).toString()});
        if (cursor != null){
        	cursor.moveToFirst();           
            textViewFor(R.id.hopName).setText(cursor.getString(cursor.getColumnIndex("name")));
  
            textViewFor(R.id.alpha).setText("Alpha acid: " + cursor.getString(cursor.getColumnIndex("alpha_acid")) + "%");
            
            textViewFor(R.id.description).setText(cursor.getString(cursor.getColumnIndex("description")));
            
            textViewFor(R.id.type).setText("Primary purpose: " + cursor.getString(cursor.getColumnIndex("type")));
            
            textViewFor(R.id.styles).setText("Beer styles: " + cursor.getString(cursor.getColumnIndex("beer_styles")));
            
            textViewFor(R.id.substitutions).setText("Possible substitutions: " + cursor.getString(cursor.getColumnIndex("substitutions")));
            DatabaseHelper.cleanupCurosr(cursor);
        }
	}
	
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		MenuInflater inflator = this.getMenuInflater();
		inflator.inflate(R.menu.details, menu);
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		switch (item.getItemId()) {
		case R.id.about:
			startActivity(new Intent(this, AboutHopRoll.class));
			return true;
		case R.id.notes:
			return true;
		case R.id.back:
			this.finish();
			return true;
		default:
			return super.onOptionsItemSelected(item);
		}
	}
	
	
	@Override
	protected void onDestroy() {
		super.onDestroy();
		DatabaseHelper.cleanupResources(this.db, this.cursor);
	}
	
	private TextView textViewFor(int id){
		return (TextView)findViewById(id);
	}
}
