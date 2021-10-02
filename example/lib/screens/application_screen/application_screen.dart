import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'package:pawns_game/providers/application_providers/application.dart';
import 'package:pawns_game/screens/games_mode_screens/football_mode_screen.dart';
import 'package:pawns_game/screens/home_screen/home_screen.dart';
import 'package:pawns_game/screens/loading_screen/loading_screen.dart';
import 'package:pawns_game/screens/prestart_screen/prestart_screen.dart';

class ApplicationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    SystemChrome.setEnabledSystemUIOverlays([]);

    return ChangeNotifierProvider(
      create: (_) => Application(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (_) => LoadingScreen(route: '/prestart_screen'),
          '/prestart_screen': (_) => PrestartScreen(),
          '/home': (_) => HomeScreen(),
          '/football_game': (_) => FootballModeScreen(),
        },
      ),
    );
  }
}
