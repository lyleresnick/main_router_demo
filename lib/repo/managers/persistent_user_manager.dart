import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:main_router_demo/repo/entities/user.dart';
import 'package:main_router_demo/repo/managers/result.dart';
import 'package:main_router_demo/repo/managers/user_manager.dart';

class PersistentUserManager extends UserManager {

  // this cache only used when modifying the user in `update`
  // if you want to cache for the ui, cache it in AppState
  User? _cachedUser;

  Future<UserResult> fetch() async {
    var prefs = await SharedPreferences.getInstance();
    final json = prefs.getString('data');
    if (json == null)
      return SemanticErrorResult(reason: UserSemanticEvent.notFound);
    final decodedJson = jsonDecode(json);
    final user = User.fromJson(decodedJson);
    if (user == null)
      return FailureResult(code: 0, description: "could not decode user");
    _cachedUser = user;
    return SuccessResult(data: user);
  }

  @override
  Future<UserResult> create(String name) async {
    var user = User(onBoardingComplete: false, name: name);
    await _save(user);
    return SuccessResult(data: user);
  }

  @override
  Future<void> clear() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.remove('data');
    _cachedUser = null;
    return;
  }

  @override
  Future<UserResult> update(bool onBoardingComplete) async {

    var user = User(onBoardingComplete: onBoardingComplete, name: _cachedUser!.name);
    await _save(user);
    return SuccessResult(data: user);
  }

  Future<void> _save(User user) async {
    var prefs = await SharedPreferences.getInstance();

    final json = user.toJson();
    final encodedJson = jsonEncode(json);
    await prefs.setString('data', encodedJson);
    _cachedUser = user;
  }
}
