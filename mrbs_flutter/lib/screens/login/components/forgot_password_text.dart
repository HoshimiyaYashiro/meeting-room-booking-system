import 'package:flutter/material.dart';
import 'package:mrbs_flutter/utils/constants.dart';

class ForgotPasswordText extends StatelessWidget {
  final Function? press;
  const ForgotPasswordText ({
    super.key,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        GestureDetector(
          onTap: press as void Function()?,
          child: const Text(
            "Forgot Password ?",
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}