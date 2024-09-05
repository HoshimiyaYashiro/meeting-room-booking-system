import 'package:flutter/material.dart';
import 'package:mrbs_flutter/components/background.dart';
import 'package:mrbs_flutter/components/form_container.dart';
import 'package:mrbs_flutter/utils/responsive.dart';
import 'components/login_form.dart';
import 'components/login_top.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: MobileLoginScreen(),
          desktop: Row(
            children: [
              Expanded(
                child: LoginTop(),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 450,
                      child: FormContainer(child: LoginForm()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        LoginTop(),
        SizedBox(height: 100),
        FormContainer(child: LoginForm()),
      ],
    );
  }
}
