import 'package:chas/src/blocs/teas_bloc.dart';
import 'package:chas/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'routes/pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => TeasBloc())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: Pages.mapPages,
        initialRoute: Routes.splash,
        theme: ThemeData(fontFamily: 'Nunito'),
      ),
    );
  }
}
