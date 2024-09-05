import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrbs_flutter/controller/screen_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Calendar',
            ),
          ],
          currentIndex: controller.currentIndex.value,
          selectedItemColor: Colors.pink,
          onTap: controller.changePage,
        ),
      ),
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: '/dashboard',
        onGenerateRoute: controller.onGenerateRoute,
      ),
    );
  }
}
