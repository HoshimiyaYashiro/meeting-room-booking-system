import 'package:get/get.dart';

import '../models/auth_token.dart';
import '../services/auth_service.dart';
import '../state/auth_manager.dart';

class AuthController extends GetxController {
  late final AuthManager _authManager;
  late final AuthService _authService;

  @override
  void onInit() {
    super.onInit();
    _authService = Get.put(AuthService());
    _authManager = Get.put(AuthManager());
  }

  Future<MeAuth?> login(
      {required String email, required String password}) async {
    MeAuth? meAuth = await _authService.fetchLogin(email, password);
    if (meAuth != null) {
      _authManager.login(meAuth.token.token);
      print('>>> User ${meAuth.user.email} logged');
      print(meAuth.token.token);
      return meAuth;
    } else {
      // Get.defaultDialog(
      //     middleText: 'User not found!',
      //     textConfirm: 'OK',
      //     confirmTextColor: Colors.white,
      //     onConfirm: () {
      //       Get.back();
      //     });
      return null;
    }
  }
}
