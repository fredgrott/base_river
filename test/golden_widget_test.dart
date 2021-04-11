// Copyright(c) 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style license.









import 'package:base_river/app/modules/appsplash/views/app_splash.dart';
import 'package:base_river/app/modules/home/views/my_home_page.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  group('Basic Golden Tests ', () {
    testWidgets('Golden test', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      await expectLater(find.byType(MyApp), matchesGoldenFile('main.png'));
    });
    testGoldens('DeviceBuilder ', (tester) async {
      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(devices: [
          Device.phone,
          Device.iphone11,
          Device.tabletPortrait,
          Device.tabletLandscape,
        ])
        ..addScenario(
          widget: MyHomePage(),
          name: 'default page',
        );
      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, "demo page multiple screens");
    });
  });

}