import 'package:flutter/material.dart';
import 'package:gymtracker/core/appstate.dart';
import 'package:gymtracker/presentation/profiles/create_profile_modal.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final profileState = context.watch<AppState>();

    if (profileState.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (!profileState.hasProfile) {
      return Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => const CreateProfileDialog(),
              );
            },
            child: const Text('Create profile'),
          ),
        ),
      );
    }

    final profile = profileState.profile!;

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, ${profile.name}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text('Weight goal: ${profile.weightGoal.toStringAsFixed(1)} kg'),
          ],
        ),
      ),
    );
  }
}
