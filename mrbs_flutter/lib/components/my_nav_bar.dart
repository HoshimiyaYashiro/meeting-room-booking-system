import 'package:flutter/material.dart';
import 'package:mrbs_flutter/utils/constants.dart';

class MyNavBar extends StatelessWidget {
  const MyNavBar(
      {super.key,
      required this.items,
      required this.onTap,
      required this.currentIndex});
  final List<NavBarItem> items;
  final Function onTap;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: items.map((item) {
        var index = items.indexOf(item);
        return InkWell(
          mouseCursor: WidgetStateMouseCursor.clickable,
          onTap: () => {
            if (index != currentIndex) onTap(index),
          },
          child: MyItem(
            item: item,
            isSelected: index == currentIndex,
          ),
        );
        // return GestureDetector(
        //   onTap: () => {
        //     if (index != currentIndex) onTap(index),
        //   },
        //   child: Row(
        //     children: [
        //       MyItem(
        //         item: item,
        //         isSelected: index == currentIndex,
        //       ),
        //       const SizedBox(width: 20,)
        //     ],
        //   ),
        // );
      }).toList(),
    );
  }
}

class MyItem extends StatelessWidget {
  final NavBarItem item;
  final bool isSelected;

  const MyItem({
    super.key,
    required this.item,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            item.title,
            style: TextStyle(
              color: isSelected ? kPrimaryColor : null,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // const SizedBox(
        //   height: 5,
        // ),
        // AnimatedContainer(
        //   duration: const Duration(milliseconds: 500),
        //   height: 3,
        //   width: 35,
        //   decoration: BoxDecoration(
        //     color: isSelected ? Colors.white : Colors.black,
        //     borderRadius: BorderRadius.circular(15.0),
        //   ),
        // )
      ],
    );
  }
}

class NavBarItem {
  final String title;

  const NavBarItem({
    Key? key,
    required this.title,
  });
}
