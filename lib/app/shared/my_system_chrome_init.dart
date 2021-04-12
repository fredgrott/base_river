// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// this also allows me to correctly display ios on android emulators as the 
// setting is still applied
void mySystemChromeInit(){
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      // per https://stackoverflow.com/questions/43727311/how-can-i-target-status-bar-color-or-opacity-in-a-flutter-app
      statusBarColor: Color(0x22663300),
      systemNavigationBarColor: Color(0x22663300),
      // per https://stackoverflow.com/questions/55211640/transparent-status-bar-in-flutter
      statusBarIconBrightness: Brightness.dark,
       systemNavigationBarIconBrightness: Brightness.dark,
    ));

}