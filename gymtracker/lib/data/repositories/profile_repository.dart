import 'package:gymtracker/data/daos/profile_dao.dart';
import 'package:gymtracker/data/models/profile.dart';

class ProfileRepository {
  final ProfileDao _profileDao;

  ProfileRepository(this._profileDao);

  Future<List<Profile>> getAllProfiles() {
    return _profileDao.getAll();
  }

  Future<Profile?> getProfile(int id) {
    return _profileDao.getById(id);
  }

  Future<Profile> createProfile({
    required String name,
    required double weightGoal,
  }) async {
    final profile = Profile(name: name, weightGoal: weightGoal);
    final id = await _profileDao.insert(profile);

    return Profile(id: id, name: name, weightGoal: weightGoal);
  }

  Future<void> updateProfile(Profile profile) async {
    await _profileDao.update(profile);
  }

  Future<void> deleteProfile(int id) async {
    await _profileDao.delete(id);
  }
}
