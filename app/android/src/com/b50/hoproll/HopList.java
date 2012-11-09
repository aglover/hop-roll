package com.b50.hoproll;

import android.app.Activity;
import android.content.Intent;
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
	protected ListView hopList;

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

		ListAdapter adapter = getAdaptorForQuery(
				"SELECT _id, name, description FROM hops ORDER BY name ASC", null);
		hopList.setAdapter(adapter);
	}
	
	public void search(View view) {		
		ListAdapter adapter = getAdaptorForQuery(
				"SELECT _id, name, description FROM hops WHERE name LIKE ?",
				new String[] { "%" + searchText.getText().toString() + "%" });
		hopList.setAdapter(adapter);
	}
	
	private ListAdapter getAdaptorForQuery(String queryString, String[] parameters) {
		return new SimpleCursorAdapter(this, 
			R.layout.hop_list_item, 
			db.rawQuery(queryString, parameters), 
			new String[] { "name", "description" }, 
			new int[] { R.id.hopName, R.id.description });
	}

}