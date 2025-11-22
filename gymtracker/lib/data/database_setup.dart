import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:gymtracker/data/dbconfig.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<void> setupDatabase(GetIt getIt) async {
  getIt.registerSingletonAsync<Database>(() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'gymtracker.db');

    return openDatabase(
      path,
      version: dbVersion,
      onCreate: (db, version) async {
        await applyMigrations(db, 0, dbVersion);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        await applyMigrations(db, oldVersion, newVersion);
      },
    );
  });
}

Future<void> applyMigrations(
  Database db,
  int oldVersion,
  int newVersion,
) async {
  for (var version = oldVersion + 1; version <= newVersion; version++) {
    var sql = (await rootBundle.loadString(
      'lib/data/migrations/v${version}_migration.sql',
    )).split(';').map((s) => s.trim()).where((s) => s.isNotEmpty);

    for (var statement in sql) {
      await db.execute(statement);
    }
  }
}
