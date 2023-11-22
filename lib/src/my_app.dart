import 'package:chas/src/routes/routes.dart';
import 'package:flutter/material.dart';

import 'routes/pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: Pages.mapPages,
      initialRoute: Routes.splash,
      theme: ThemeData(fontFamily: 'Nunito'),
    );
  }
}
