package com.ag.hops;

import android.app.Activity;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.EditText;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleCursorAdapter;

public class HopList extends Activity {

	protected EditText searchText;
	protected SQLiteDatabase db;
	protected Cursor cursor;
	protected ListAdapter adapter;
	protected ListView hopList;

	/** Called when the activity is first created. */
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);
		db = (new DatabaseHelper(this)).getWritableDatabase();
		searchText = (EditText) findViewById(R.id.searchText);
		hopList = (ListView) findViewById(R.id.list);
		hopList.setOnItemClickListener(new OnItemClickListener() {

			public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
				Intent intent = new Intent(parent.getContext(), HopDetails.class);	
		    	intent.putExtra("hop_id", id);
		    	startActivity(intent);
			}
		});
	}

	public void search(View view) {
		// || is the concatenation operation in SQLite
		// note, _id is required for Android libs
		cursor = db.rawQuery(
				"SELECT _id, name, description FROM hops WHERE name LIKE ?",
				new String[] { "%" + searchText.getText().toString() + "%" });
		adapter = new SimpleCursorAdapter(this, R.layout.hop_list_item, cursor,
				new String[] { "name", "description" }, new int[] {
						R.id.hopName, R.id.description });
		hopList.setAdapter(adapter);
	}

}