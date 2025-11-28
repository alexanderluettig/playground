import 'package:get_it/get_it.dart';
import 'package:gymtracker/data/daos/profile_dao.dart';
import 'package:gymtracker/data/repositories/profile_repository.dart';
import 'package:sqflite/sqflite.dart';

Future<void> setupRepositories(GetIt getIt) async {
  getIt.registerLazySingleton<ProfileDao>(() => ProfileDao(getIt<Database>()));

  getIt.registerLazySingleton<ProfileRepository>(
    () => ProfileRepository(getIt<ProfileDao>()),
  );
}
