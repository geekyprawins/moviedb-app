import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import 'package:themoviedb_app/services/http_service.dart';
import 'package:themoviedb_app/services/movie_service.dart';

import 'package:themoviedb_app/models/config.dart';

class SplashPage extends StatefulWidget {
  final VoidCallback? onInit;
  const SplashPage({Key? key, @required this.onInit}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
    ).then(
      (value) => setUp(context).then(
        (value) => widget.onInit!(),
      ),
    );
  }

  Future<void> setUp(BuildContext context) async {
    final getIt = GetIt.instance;
    final configFile = await rootBundle.loadString('assets/config/main.json');
    final configData = jsonDecode(configFile);

    getIt.registerSingleton<AppConfig>(
      AppConfig(
          API_KEY: configData['API_KEY'],
          BASE_API_URL: configData['BASE_API_URL'],
          BASE_IMAGE_API_URL: configData['BASE_IMAGE_API_URL']),
    );

    getIt.registerSingleton<HTTPService>(
      HTTPService(),
    );

    getIt.registerSingleton<MovieService>(
      MovieService(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flickd",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logo.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
