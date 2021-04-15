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
    // 
    // An attempt at a full screen with transparent systemUis on android
    // this way if we need either status-bar or navbar systemUis not 
    // displayed on android we just add one out of three lines depending 
    // out use cases as we will have 
    //    display both keep original
    //    display status-bar-only  ie top
    //    display nav-bar-only ie bottom
    //    or display no system-UI ie full naked screen
    // 
    //    It has a companion changes in the MainActivity:
    // import android.os.Build
    // import android.view.WindowManager
    // import androidx.core.view.WindowCompat
    // import io.flutter.embedding.android.FlutterActivity
    //
    //
    // class MainActivity: FlutterActivity() {
    //
    // override fun onPostResume() {
     //   super.onPostResume()
     //
        // to handle case of the bottom sys navbar
        //if(Build.VERSION.SDK_INT>= Build.VERSION_CODES.O_MR1){
         //   window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS)
         //   window.addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_NAVIGATION)
        //}
     //
        // fixes edge to edge on 30 and beyond only
        //if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
         //   WindowCompat.setDecorFitsSystemWindows(window, false)
         //   window.navigationBarColor = 0
       //
       // }
     //
    //}
   //
   //}

    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
          
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarDividerColor: Colors.transparent,
        ),
        child: PlatformScaffold(
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
        ));
  }
}
