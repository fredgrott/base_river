// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

MaterialAppBarData myMaterialAppBarData = MaterialAppBarData(
  textTheme: myMaterialTitleTextTheme ,
  // to adjust to iOS which defaults to title centered when no icons are present
  centerTitle: true,
  brightness: Brightness.light,
  // when we want it transparent such as when using background images
  backgroundColor: const Color(0x22584103),
  elevation: 0,
  bottomOpacity: 90,
  systemOverlayStyle: const SystemUiOverlayStyle(
          // per https://stackoverflow.com/questions/43727311/how-can-i-target-status-bar-color-or-opacity-in-a-flutter-app
          statusBarColor: Color(0x22584103),
          systemNavigationBarColor: Color(0x22584103),
          // per https://stackoverflow.com/questions/55211640/transparent-status-bar-in-flutter
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
);

TextTheme myMaterialTitleTextTheme = const TextTheme(
  headline6: TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold  
    )
);