// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:base_river/app/themes/my_material_app_bar_theme.dart';
import 'package:flutter/material.dart';

final materialTheme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.purple,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: myMaterialAppBarTheme
);