package com.b50.hoproll;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.Color;
import android.os.Bundle;
import android.text.InputType;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewGroup.MarginLayoutParams;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;

public class HopNotes extends HopDetails {

	private final int NOTES_ID = 302069;
	private final int BUTTON_ID = 403069;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		View linearLayout = findViewById(R.id.details);
		addEditText(linearLayout);
		addButton(linearLayout);
	}

	private void addButton(View linearLayout) {
		Button addNotes = new Button(this);
		addNotes.setText(R.string.notes_button);
		addNotes.setId(BUTTON_ID);
		addNotes.setTextSize(16);
		addNotes.setTextColor(Color.BLACK);

		addNotes.setOnClickListener(new OnClickListener() {
			public void onClick(View v) {
				EditText notes = (EditText) findViewById(NOTES_ID);
				String userNotes = notes.getText().toString().trim();
				if (userNotes != null && !userNotes.equals("")) {
					DatabaseHelper.cleanupResources(db, cursor);
					SQLiteDatabase db = new DatabaseHelper(
							getApplicationContext()).getWritableDatabase();

					Cursor cursor = db.rawQuery(
							"SELECT user_notes FROM hops WHERE _id = ?",
							new String[] { Long.valueOf(hopId).toString() });
					
					if (cursor != null) {
						cursor.moveToFirst();
						String existingNotes = cursor.getString(cursor.getColumnIndex("user_notes"));
						if (existingNotes != null && !existingNotes.equals("")) {
							userNotes = existingNotes + ", " + userNotes;
						}
					}

					ContentValues args = new ContentValues();
					args.put("user_notes", userNotes);
					db.update("hops", args, "_id" + "=" + hopId, null);
					notes.setText("");
					finish();
					db.close();
				}
			}
		});

		MarginLayoutParams buttonLayout = new MarginLayoutParams(
				new LinearLayout.LayoutParams(LayoutParams.WRAP_CONTENT,
						LayoutParams.WRAP_CONTENT));
		buttonLayout.setMargins(-4, 10, 0, 10);
		LayoutParams lp = new LinearLayout.LayoutParams(buttonLayout);
		addNotes.setLayoutParams(lp);
		((LinearLayout) linearLayout).addView(addNotes, lp);
	}

	private void addEditText(View linearLayout) {
		EditText notes = new EditText(this);
		notes.setHint(R.string.notes_hint);
		notes.setInputType(InputType.TYPE_CLASS_TEXT);
		notes.setId(NOTES_ID);
		notes.setTextSize(16);
		notes.setTextColor(Color.BLACK);
		MarginLayoutParams layout = new MarginLayoutParams(
				new LinearLayout.LayoutParams(LayoutParams.FILL_PARENT,
						LayoutParams.WRAP_CONTENT));
		layout.setMargins(0, 10, 0, 10);
		notes.setLayoutParams(layout);
		((LinearLayout) linearLayout).addView(notes, layout);
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
}
