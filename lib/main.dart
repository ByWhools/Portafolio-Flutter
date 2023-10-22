import 'dart:js';

import 'package:flutter/material.dart';
import 'package:portafolio/src/UI/About/Aboutme.dart';
import 'package:portafolio/src/UI/Home/Home.dart';
import 'package:portafolio/src/UI/Proyects/Proyects.dart';
import 'package:portafolio/src/provider/theme_dark.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

Offset offset = Offset(0, 0);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  ThemeDark themeDark = ThemeDark();
  await themeDark.loadThemeMode();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeDark>.value(
        value: themeDark,
      )
    ],
    child: Consumer<ThemeDark>(
      builder: (context, themeDark, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          color: themeDark.blackforWhite,
          title: 'Young Lely 👾',
          initialRoute: '/',
          routes: {
            '/': (context) => const Home(),
            '/AboutMe': (context) => const Aboutme(),
            '/Projects': (context) => const Proyects()
          },
        );
      },
    ),
  ));
}
