import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../state/auth_manager.dart';

class AuthMiddleware extends GetMiddleware {
  final AuthManager _authManager = Get.find();
  
  @override
  RouteSettings? redirect(String? route) {
    print('>>> Route $route called');
    if (_authManager.isLoggedIn.value) {
      return route == '/login' ? const RouteSettings(name: '/home') : null;
    } else {
      return route == '/login' ? null : const RouteSettings(name: '/login');
    }
  }

  // @override
  // GetPage? onPageCalled(GetPage? page) {
  //   print('>>> Page ${page.name} called');
  //   print('>>> User ${authController.username} logged');
  //   return authController.username != null
  //       ? page.copyWith(parameter: {'user': authController.username})
  //       : page;
  // }

  // @override
  // List<Bindings> onBindingsStart(List<Bindings> bindings) {
  //   // This function will be called right before the Bindings are initialize,
  //   // then bindings is null
  //   bindings = [OtherBinding()];
  //   return bindings;
  // }

  // @override
  // GetPageBuilder onPageBuildStart(GetPageBuilder page) {
  //   print('Bindings of ${page.toString()} are ready');
  //   return page;
  // }

  // @override
  // Widget onPageBuilt(Widget page) {
  //   print('Widget ${page.toStringShort()} will be showed');
  //   return page;
  // }

  // @override
  // void onPageDispose() {
  //   print('PageDisposed');
  // }
}