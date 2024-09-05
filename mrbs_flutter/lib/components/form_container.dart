import 'package:flutter/material.dart';

import '../utils/constants.dart';

class FormContainer extends StatelessWidget {
  final Widget child;
  const FormContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: const Color.fromRGBO(255, 255, 255, 0.7),
      //   borderRadius: BorderRadius.circular(16)
      // ),
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 2, vertical: defaultPadding),
      margin: const EdgeInsets.all(defaultPadding),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SafeArea(child: child),
        ],
      ),
    );
  }
}
