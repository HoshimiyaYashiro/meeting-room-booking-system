import 'package:get_storage/get_storage.dart';

import 'enum_key.dart';


mixin StorageManager {
  Future<bool> saveToken(String? token) async {
    final box = GetStorage();
    await box.write(AuthManager.token.toString(), token);
    return true;
  }

  String? getToken() {
    final box = GetStorage();
    return box.read(AuthManager.token.toString());
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(AuthManager.token.toString());
  }
}