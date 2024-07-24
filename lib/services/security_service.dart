import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecurityService {
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  Future<void> saveSecurityKey(String key) async {
    await _secureStorage.write(key: 'securityKey', value: key);
  }

  Future<String?> getSecurityKey() async {
    return await _secureStorage.read(key: 'securityKey');
  }

  Future<void> deleteSecurityKey() async {
    await _secureStorage.delete(key: 'securityKey');
  }

  Future<void> clearAllData() async {
    await _secureStorage.deleteAll();
  }
}
