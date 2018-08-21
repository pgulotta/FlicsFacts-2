package com.twentysixapps.flicsfacts2;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.text.Html;

public class MovieShareIntent extends org.qtproject.qt5.android.bindings.QtActivity {
  private static MovieShareIntent m_instance;

  public MovieShareIntent() {
    m_instance = this;
  }

  static public void startShareActivity(String content, org.qtproject.qt5.android.bindings.QtActivity activity) {
    Intent intent = new Intent(Intent.ACTION_SEND);
    intent.setType("text/plain");
    intent.putExtra(Intent.EXTRA_SUBJECT,  activity.getString(R.string.from_app));
    intent.putExtra(Intent.EXTRA_TEXT, content);
    activity.startActivity(Intent.createChooser(intent, activity.getString(R.string.share_app)));
  }

}

//  javap -s -classpath C:\Source\GitHub\FlicFactsMaster\Debug\android-build\build\intermediates\classes\debug  com.twentysixapps.flicsfacts2.MovieShareIntent
/*
Compiled from "MovieShareIntent.java"
public class com.twentysixapps.flicsfacts2.MovieShareIntent extends org.qtproject.qt5.android.bindings.QtActivity {
  public com.twentysixapps.flicsfacts2.MovieShareIntent();
    descriptor: ()V

  public static void startShareActivity(java.lang.String, org.qtproject.qt5.android.bindings.QtActivity);
    descriptor: (Ljava/lang/String;Lorg/qtproject/qt5/android/bindings/QtActivity;)V
}

*/
