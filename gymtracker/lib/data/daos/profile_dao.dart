import 'package:gymtracker/data/models/profile.dart';
import 'package:sqflite/sqflite.dart';

class ProfileDao {
  final Database db;

  ProfileDao(this.db);

  Future<int> insert(Profile profile) async {
    return db.insert(
      'profiles',
      profile.toMap()..remove('id'),
      conflictAlgorithm: ConflictAlgorithm.rollback,
    );
  }

  Future<Profile?> getById(int id) async {
    final result = await db.query(
      'profiles',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );

    if (result.isEmpty) return null;
    return Profile.fromMap(result.first);
  }

  Future<List<Profile>> getAll() async {
    final result = await db.query('profiles');
    return result.map((row) => Profile.fromMap(row)).toList();
  }

  Future<int> update(Profile profile) async {
    if (profile.id == null) {
      throw ArgumentError('Cannot update Profile without id');
    }

    return db.update(
      'profiles',
      profile.toMap(),
      where: 'id = ?',
      whereArgs: [profile.id],
    );
  }

  Future<int> delete(int id) async {
    return db.delete('profiles', where: 'id = ?', whereArgs: [id]);
  }
}
