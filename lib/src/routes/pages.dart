import 'package:chas/src/views/categories/categories_view.dart';
import 'package:chas/src/views/filtered_teas/filtered_teas_view.dart';
import 'package:chas/src/views/home/home_view.dart';
import 'package:chas/src/views/prepare_tea_view/prepare_tea_view.dart';
import 'package:chas/src/views/splash/splash_screen.dart';
import 'package:chas/src/views/start_view/start_view.dart';
import 'package:flutter/widgets.dart';

import '../views/info_tea_view/info_tea_view.dart';
import 'routes.dart';

class Pages {
  static Map<String, Widget Function(BuildContext)> mapPages = {
    Routes.splash: (context) => const SplashScreen(),
    Routes.startView: (context) => const StartView(),
    Routes.home: (context) => const HomeView(),
    Routes.infoTea: (context) => const InfoTeaView(),
    Routes.categories: (context) => CategoriesView(),
    Routes.filteredTeas: (context) => FilteredTeasView(),
    Routes.prepareTea: (context) => PrepareTeaView(),
  };
}
