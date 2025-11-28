import 'package:flutter/material.dart';
import 'package:gymtracker/data/models/profile.dart';
import 'package:gymtracker/data/repositories/profile_repository.dart';

class AppState extends ChangeNotifier {
  final ProfileRepository _repo;

  Profile? _profile;
  bool _isLoading = true;

  AppState(this._repo) {
    _loadProfile();
  }

  Profile? get profile => _profile;
  bool get isLoading => _isLoading;
  bool get hasProfile => _profile != null;

  Future<void> _loadProfile() async {
    _isLoading = true;
    notifyListeners();

    final existing = await _repo.getAllProfiles();

    _profile = existing.isNotEmpty ? existing.first : null;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> createOrUpdateProfile({
    required String name,
    required double weightGoal,
  }) async {
    if (_profile == null) {
      // neu anlegen
      final created = await _repo.createProfile(
        name: name,
        weightGoal: weightGoal,
      );
      _profile = created;
    } else {
      // updaten
      final updated = Profile(
        id: _profile!.id,
        name: name,
        weightGoal: weightGoal,
      );
      await _repo.updateProfile(updated);
      _profile = updated;
    }

    notifyListeners();
  }
}
