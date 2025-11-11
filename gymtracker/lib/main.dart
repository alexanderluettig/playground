import 'package:flutter/material.dart';
import 'package:gymtracker/features/navigation/navigation.dart';
import 'package:provider/provider.dart';
import 'core/appstate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GymAppState(),
      child: MaterialApp(
        title: 'Gym Tracking App',
        home: NavigationPage(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        ),
      ),
    );
  }
}
