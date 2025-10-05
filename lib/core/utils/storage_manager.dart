import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:marketi/core/utils/service_locator.dart';
import 'package:marketi/core/utils/storage_keys.dart';

class StorageManager {
  StorageManager() {
    initSecureStorage();
  }

  initSecureStorage() {
    AndroidOptions getAndroidOptions() =>
        const AndroidOptions(encryptedSharedPreferences: true);
    _secureStorage ??= FlutterSecureStorage(aOptions: getAndroidOptions());
  }

  FlutterSecureStorage? _secureStorage;

  Future<void> saveToken({required String value}) async {
    await _secureStorage!.write(key: di<StorageKeys>().tokenKey, value: value);
  }

  Future<String> getToken({required String key}) async {
    return await _secureStorage!.read(key: key) ?? "";
  }

  Future<void> removeToken({required String key}) async {
    await _secureStorage!.delete(key: key);
  }
}
