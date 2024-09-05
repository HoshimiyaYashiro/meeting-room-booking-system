import 'package:flutter/material.dart';

class LoginTop extends StatelessWidget {
  const LoginTop({  
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Image.asset("assets/icons/logo.png", width: 200),
        ),
      ],
    );
  }
}