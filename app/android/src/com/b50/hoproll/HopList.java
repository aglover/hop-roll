package com.b50.hoproll;

import android.app.Activity;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.EditText;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleCursorAdapter;

public class HopList extends Activity {
	protected SQLiteDatabase db;
	protected ListView hopList;
	protected Cursor cursor;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		try {
			setContentView(R.layout.main);
			this.db = (new DatabaseHelper(this)).getWritableDatabase();
			this.hopList = (ListView) findViewById(R.id.list);
			this.hopList.setOnItemClickListener(new OnItemClickListener() {

				public void onItemClick(AdapterView<?> parent, View view,
						int position, long id) {
					Intent intent = new Intent(parent.getContext(),
							HopDetails.class);
					intent.putExtra("hop_id", id);
					startActivity(intent);
				}
			});

			ListAdapter adapter = getAdaptorForQuery(
					"SELECT _id, name, description FROM hops ORDER BY name ASC",
					null);
			this.hopList.setAdapter(adapter);
		} catch(Exception e) {
			 Log.d("hoproll", "exception in oncreate: " + e.getLocalizedMessage());
		}
	}

	@Override
	protected void onDestroy() {
		super.onDestroy();
		DatabaseHelper.cleanupResources(this.db, this.cursor);
	}

	public void search(View view) {	
		EditText searchText = (EditText) findViewById(R.id.searchText);
		ListAdapter adapter = getAdaptorForQuery(
				"SELECT _id, name, description FROM hops WHERE name LIKE ?",
				new String[] { "%" + searchText.getText().toString() + "%" });
		this.hopList.setAdapter(adapter);
	}

	private ListAdapter getAdaptorForQuery(String queryString, String[] parameters) {
		DatabaseHelper.cleanupCurosr(cursor);
		this.cursor = db.rawQuery(queryString, parameters);
		return new SimpleCursorAdapter(this, R.layout.hop_list_item,
				this.cursor, new String[] { "name", "description" }, new int[] {
						R.id.hopName, R.id.description });
	}
}