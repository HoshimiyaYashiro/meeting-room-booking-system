import 'package:flutter/material.dart';

import '../utils/constants.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    super.key,
    required this.child,
    this.bgImage = "images/golf-ball-field.webp",
  });

  final String bgImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(defaultPadding),
        // decoration: BoxDecoration(
        //   image: DecorationImage(image: AssetImage(bgImage), fit: BoxFit.cover),
        // ),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SafeArea(child: child),
          ],
        ),
      ),
    );
  }
}