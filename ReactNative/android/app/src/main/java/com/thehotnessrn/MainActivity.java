package com.thehotnessrn;

import com.facebook.react.ReactActivity;
import android.os.Bundle;

public class MainActivity extends ReactActivity {

  /**
   * Returns the name of the main component registered from JavaScript. This is used to schedule
   * rendering of the component.
   */
  @Override
  protected String getMainComponentName() {
    return "TheHotnessRN";
  }
  
  /**
   * This override is required to avoid crashes related to View state being not persisted consistently across Activity restarts.
   * See https://reactnavigation.org/docs/getting-started
   */
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(null);
  }
}
