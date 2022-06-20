import 'package:micro_digital/src/data/client/api_client.dart';
import 'package:micro_digital/src/data/repository/repository.dart';
import 'package:micro_digital/src/data/shared_pref/prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// it is a hub that connecting pref,repo,client
/// used to reduce imports in pages
class ObjectFactory {
  static final _objectFactory = ObjectFactory._internal();

  ObjectFactory._internal();

  factory ObjectFactory() => _objectFactory;

  ///Initialisation of Objects
  final Prefs _prefs = Prefs();
  final ApiClient _apiClient = ApiClient();
  final Repository _repository = Repository();

  ///
  /// Getters of Objects
  ///

  Prefs get prefs => _prefs;

  ApiClient get apiClient => _apiClient;

  Repository get repository => _repository;

  ///
  /// Setters of Objects
  ///

  void setPrefs(SharedPreferences sharedPreferences) {
    _prefs.sharedPreferences = sharedPreferences;
  }
}
