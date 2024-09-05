import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../services/auth_service.dart';

class AuthController extends GetxController {
  final AuthService _authService = Get.put(AuthService());
  final logger = Logger();
  Future<void> login({required String email, required String password}) async {
    await _authService.login(email, password);
    if (!_authService.isLoggedIn) {
      Get.defaultDialog(
          middleText: 'User not found!',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    } else {
      Get.offAllNamed('/home');
    }
  }
}
