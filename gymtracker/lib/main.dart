import 'package:flutter/material.dart';
import 'package:gymtracker/dependencies.dart';
import 'package:gymtracker/features/navigation/navigation.dart';
import 'package:provider/provider.dart';
import 'core/appstate.dart';

void main() async {
  await setupDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

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
