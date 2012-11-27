package com.b50.hoproll;

import android.graphics.Color;
import android.os.Bundle;
import android.text.InputType;
import android.util.Log;
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
		Log.d("HopRoll", "hop id is " + this.hopId);
		View linearLayout = findViewById(R.id.details);
		addEditText(linearLayout);
		addButton(linearLayout);
	}

	private void addButton(View linearLayout) {
		Button addNotes = new Button(this);
		addNotes.setText("Add Notes");
		addNotes.setId(BUTTON_ID);
		addNotes.setTextSize(16);
		addNotes.setTextColor(Color.BLACK);

		addNotes.setOnClickListener(new OnClickListener() {
			public void onClick(View v) {
				EditText notes = (EditText) findViewById(NOTES_ID);
				String userNotes = notes.getText().toString();
				Log.d("HopRoll", "notes are " + userNotes);
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
		notes.setHint("Hop Notes");
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

}
