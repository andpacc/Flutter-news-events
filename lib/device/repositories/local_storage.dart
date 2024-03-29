import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorage {}

@LazySingleton(as: LocalStorage)
class LocalStorageImpl implements LocalStorage {
  final SharedPreferences _storage;
  LocalStorageImpl(this._storage);

  // #region Functions for saving and retry data
  setBool({required String key, required bool value}) {
    return _storage.setBool(key, value);
  }

  Future<bool> getBool({required String key}) async {
    return _storage.getBool(key) ?? false;
  }

  setDouble({required String key, required double value}) async {
    await _storage.setDouble(key, value);
  }

  Future<double> getDouble({required String key}) async {
    final double? storageValue = _storage.getDouble(key);
    if (storageValue != null) {
      return storageValue;
    }
    return 0;
  }

  setInt({required String key, required int value}) async {
    await _storage.setInt(key, value);
  }

  Future<int> getInt({required String key}) async {
    final int? storageValue = _storage.getInt(key);
    if (storageValue != null) {
      return storageValue;
    }
    return 0;
  }

  setString({required String key, required String value}) async {
    await _storage.setString(key, value.toString());
  }

  String getString({required String key}) {
    final String? value = _storage.getString(key);
    return value ?? '';
  }

  // #endregion
}
