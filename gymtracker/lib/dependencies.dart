import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:gymtracker/data/database_setup.dart';
import 'package:gymtracker/data/repositories_setup.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupDatabase(getIt);
  await setupRepositories(getIt);

  await getIt.allReady();
}
