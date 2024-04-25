import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:music_store/core/enums/bottom_navigation.dart';
import 'package:music_store/ui/shared/utils.dart';
import 'package:music_store/ui/views/login_view/login_view.dart';
import 'package:music_store/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: BotToastInit(), //1. call BotToastInit
      navigatorObservers: [BotToastNavigatorObserver()],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: storage.getIsLogined()
          ? MainView(
              pageNumber: 1,
              selectedItem: BottomNavigationEnum.HOME,
            )
          : LoginView(),
    );
  }
}
