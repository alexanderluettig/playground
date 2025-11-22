import 'package:flutter/material.dart';
import 'package:gymtracker/features/exercises/exercises.dart';
import 'package:gymtracker/features/history/history.dart';
import 'package:gymtracker/features/plans/plans.dart';
import 'package:gymtracker/features/home/home.dart';
import 'package:gymtracker/features/Workout/Workout.dart';

class NavigationPage extends StatefulWidget {
  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = HomePage();
      case 1:
        page = PlansPage();
      case 2:
        page = WorkoutPage();
      case 3:
        page = ExercisesPage();
      case 4:
        page = HistoryPage();
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: page,
          ),
          bottomNavigationBar: SafeArea(
            child: NavigationBar(
              destinations: [
                NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                NavigationDestination(
                  icon: Icon(Icons.assignment),
                  label: 'Plans',
                ),
                NavigationDestination(
                  icon: Icon(Icons.timer),
                  label: 'Workout',
                ),
                NavigationDestination(
                  icon: Icon(Icons.fitness_center),
                  label: 'Exercises',
                ),
                NavigationDestination(
                  icon: Icon(Icons.history),
                  label: 'History',
                ),
              ],
              selectedIndex: selectedIndex,
              onDestinationSelected: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
            ),
          ),
        );
      },
    );
  }
}
