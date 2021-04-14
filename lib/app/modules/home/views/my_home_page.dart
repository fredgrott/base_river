// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:base_river/app/themes/my_cupertino_navigation_bar_data.dart';
import 'package:base_river/app/themes/my_cupertino_page_scaffold_data.dart';
import 'package:base_river/app/themes/my_material_app_bar_data.dart';
import 'package:base_river/app/themes/my_material_scaffold_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final counterProvider = StateProvider((ref) => 0);

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    //
    // IMHO the best layout cheatsheet is the one at:
    // https://github.com/TakeoffAndroid/flutter-examples
    // which was created by Chandrasekar Kuppusamy
    return PlatformScaffold(
      material: (
        _,
        __,
      ) =>
          myMaterialScaffoldData,
      cupertino: (
        _,
        __,
      ) =>
          myCupertinoPageScaffoldData,
      backgroundColor: Colors.transparent,
      appBar: PlatformAppBar(
        backgroundColor: Colors.transparent,
        title: PlatformText('Base River'),
        material: (
          _,
          __,
        ) =>
            myMaterialAppBarData,
        cupertino: (_, __) => myCupertinoNavigationBarData,
        trailingActions: <Widget>[
          PlatformIconButton(
            padding: EdgeInsets.zero,
            icon: Icon(context.platformIcons.share),
            color: Colors.black87,
            onPressed: () {},
          ),
        ],
      ),
      // using stack to place background image at bottom and layer content on top
      body: Stack(children: <Widget>[
        Center(
            child: Container(
                // have to instruct the DecoratedBox to expand to the
                // expanded container size as we set body extended
                constraints: const BoxConstraints.expand(),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("images/background.jpg"),
                  fit: BoxFit.cover,
                )))),
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PlatformText("increment or decrement"),
            Consumer(builder: (context, watch, _) {
              final dynamic count = watch(counterProvider).state;
              return Text('$count');
            }),
          ],
        )),
        // since  we are using a parent stack container we can fake a cross-platform non-nav-fab with 
        // a positioned container that contains buttons
        Positioned(
            bottom: 54,
            right: 34,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  PlatformIconButton(
                    onPressed: () {
                      context.read(counterProvider).state++;
                    },
                    padding: EdgeInsets.zero,
                    icon: Icon(context.platformIcons.addCircledSolid),
                  ),
                  PlatformIconButton(
                    onPressed: () {
                      context.read(counterProvider).state--;
                    },
                    padding: EdgeInsets.zero,
                    icon: Icon(context.platformIcons.deleteSolid),
                  ),
                ]))
      ]),
    );
  }
}
