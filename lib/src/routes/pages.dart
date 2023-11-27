import 'package:chas/src/views/home/home_view.dart';
import 'package:chas/src/views/splash/splash_screen.dart';
import 'package:chas/src/views/start_view/start_view.dart';
import 'package:flutter/widgets.dart';

import 'routes.dart';

class Pages {
  static Map<String, Widget Function(BuildContext)> mapPages = {
    Routes.splash: (context) => const SplashScreen(),
    Routes.startView: (context) => const StartView(),
    Routes.home: (context) =>  HomeView(),
  };
}
