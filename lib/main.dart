import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themoviedb_app/pages/main_page.dart';
import 'package:themoviedb_app/pages/splash_page.dart';

void main() {
  runApp(
    SplashPage(
      key: UniqueKey(),
      onInit: () {
        runApp(const ProviderScope(child: MyApp()));
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flickd",
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        "home": (BuildContext context) => MainPage(),
      },
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
    );
  }
}
