import 'package:get/get.dart';

import '../utils/storage_manager.dart';

class AuthManager extends GetxController with StorageManager {
  final isLoggedIn = false.obs;
  final authToken = ''.obs;

  void logOut() {
    isLoggedIn.value = false;
    authToken.value = '';
    removeToken();
  }

  Future<void> login(String token) async {
    isLoggedIn.value = true;
    authToken.value = token;
    //Token is cached
    await saveToken(token);
  }

  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      authToken.value = token;
      isLoggedIn.value = true;
    }
  }
}