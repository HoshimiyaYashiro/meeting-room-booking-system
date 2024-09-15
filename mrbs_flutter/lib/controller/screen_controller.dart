import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrbs_flutter/controller/branch_controller.dart';
import 'package:mrbs_flutter/controller/user_controller.dart';

import '../screens/home/pages/calendar/calendar_page.dart';
import '../screens/home/pages/dashboard/dashboard_page.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  UserController get userController => Get.find<UserController>();
  BranchController get branchController => Get.find<BranchController>();
  var currentIndex = 0.obs;

  final pages = <String>['/dashboard', '/webview'];

  @override
  void onInit() async {
    super.onInit();
    await userController.fetchInitialData();
    await branchController.fetchInitialData();
  }

  void changePage(int index) {
    currentIndex.value = index;
    Get.toNamed(pages[index], id: 1);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/dashboard') {
      return GetPageRoute(
        settings: settings,
        page: () => const DashboardPage(),
        binding: DashboardBinding(),
      );
    }
    if (settings.name == '/webview') {
      return GetPageRoute(
        settings: settings,
        page: () => const CalendarPage(),
        binding: CalendarBinding(),
      );
    }
    return null;
  }
}

class DashboardController extends GetxController {
  final title = 'Dashboard'.obs;
}

class CalendarController extends GetxController {
  final title = 'Calendar'.obs;
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
  }
}

class CalendarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CalendarController());
  }
}
