import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:gymtracker/core/appstate.dart';
import 'package:gymtracker/data/database_setup.dart';
import 'package:gymtracker/data/repositories/profile_repository.dart';
import 'package:gymtracker/data/repositories_setup.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupDatabase(getIt);
  await setupRepositories(getIt);

  getIt.registerLazySingleton<AppState>(
    () => AppState(getIt<ProfileRepository>()),
  );

  await getIt.allReady();
}
