import 'package:directus/directus.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../services/user_service.dart';

class UserController extends GetxController {
  final UserService _userService = Get.put(UserService());

  final logger = Logger();

  final user = Rxn<DirectusUser>();

  fetchInitialData() async {
    var user = await _userService.getCurrentUser();
    if (user != null) {
      this.user.value = user;
      logger.i(user.toJson());
    }
  }
}
