// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:evievm_app/src/features/auth/data/models/response/user_profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _KEY_TOKEN = '_KEY_TOKEN';
const _KEY_USER_PROFILE = '_KEY_USER_PROFILE';
const _KEY_LOGIN_EMAIL = '_KEY_LOGIN_EMAIL';
const _TEST_USER_TOKEN =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiMTIiLCJjYXJ0X2lkIjoiOSIsInN1YiI6IjA5ODgyMDIwNzEiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJ1c2VyIiwiZXhwIjoxNzEwOTIzMjkxLCJpc3MiOiJEVFQiLCJhdWQiOiJEVFQifQ.FI_TEWuQ-MgMFGs6jZ42j1fI2dPFRqzSZE_iCxQIMkk';

class Storage {
  late final SharedPreferences _preferences;
  Future<Storage> init() async {
    _preferences = (await SharedPreferences.getInstance());
    return this;
  }

  Future<void> deleteAll() async {
    deleteToken();
  }
}

extension TokenStrorage on Storage {
  Future<void> saveToken(String value) async {
    await _preferences.setString(_KEY_TOKEN, value);
  }

  Future<void> deleteToken() async {
    await _preferences.remove(_KEY_TOKEN);
  }

  String? get token => _preferences.getString(_KEY_TOKEN);
}

extension LoginEmailStrorage on Storage {
  Future<void> saveLoginEmail(String value) async {
    await _preferences.setString(_KEY_LOGIN_EMAIL, value);
  }

  Future<void> deleteLoginEmail() async {
    await _preferences.remove(_KEY_LOGIN_EMAIL);
  }

  String? get loginEmail => _preferences.getString(_KEY_LOGIN_EMAIL);
}

extension ProfileStrorage on Storage {
  Future<void> saveUserProfile(UserProfileModel value) async {
    await _preferences.setString(_KEY_USER_PROFILE, jsonEncode(value.toJson()));
  }

  Future<void> deleteUserProfile() async {
    await _preferences.remove(_KEY_USER_PROFILE);
  }

  UserProfileModel? get userProfile {
    String? json = _preferences.getString(_KEY_USER_PROFILE);
    if (json == null) return null;
    return UserProfileModel.fromJson(jsonDecode(json));
  }
}
