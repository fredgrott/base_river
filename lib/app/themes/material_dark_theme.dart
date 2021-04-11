// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:base_river/app/themes/my_color_scheme.dart';
import 'package:base_river/app/themes/my_material_app_bar_theme.dart';
import 'package:base_river/app/themes/my_material_text_theme.dart';
import 'package:flutter/material.dart';

final materialDarkTheme = ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.teal,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: myMaterialTextTheme,
      colorScheme: MyColorScheme,
      appBarTheme: myMaterialAppBarTheme
);