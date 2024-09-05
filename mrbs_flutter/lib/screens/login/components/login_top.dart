import 'package:flutter/material.dart';
import 'package:mrbs_flutter/utils/responsive.dart';

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
          child: Responsive(
            mobile: Image.asset("assets/icons/logo.png", width: 300), 
            desktop: Image.asset("assets/icons/logo.png", height: 150),
          )
        ),
      ],
    );
  }
}