import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrbs_flutter/controller/branch_controller.dart';
import 'package:mrbs_flutter/controller/screen_controller.dart';
import 'package:mrbs_flutter/utils/responsive.dart';

import '../../components/my_nav_bar.dart';
import '../../models/branch.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: MobileHomeScreen(), desktop: DesktopHomeScreen());
  }
}

class DesktopHomeScreen extends GetView<HomeController> {
  const DesktopHomeScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    BranchController branchController = Get.find<BranchController>();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Image(
              image: AssetImage('assets/images/n-logo.png'),
              width: 32,
            ),
            const SizedBox(width: 20),
            Obx(() => MyNavBar(
                    items: const [
                      NavBarItem(title: 'Dashboard'),
                      NavBarItem(title: 'Calendar'),
                    ],
                    onTap: controller.changePage,
                    currentIndex: controller.currentIndex.value)),
          ],
        ),
        actions: [
          Obx(() => DropdownButton(
                value: branchController.selectedBranchId.value,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {
                  branchController.selectedBranchId.value = newValue!;
                },
                items: branchController.branches.value
                    ?.map<DropdownMenuItem<String>>((Branch branch) {
                  return DropdownMenuItem<String>(
                    value: branch.id,
                    child: Text(branch.name),
                  );
                }).toList(),
              )),
          const SizedBox(width: 20),
          // const CircleAvatar(
          //   backgroundImage: AssetImage('assets/images/profile.jpg'),
          //   radius: 20,
          // ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: '/dashboard',
        onGenerateRoute: controller.onGenerateRoute,
      ),
    );
  }
}

class MobileHomeScreen extends GetView<HomeController> {
  const MobileHomeScreen({
    super.key,
  });

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
