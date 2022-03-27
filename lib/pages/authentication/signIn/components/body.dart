import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/size_config.dart';
import '../../../../pages/authentication/signUp/sign_up_screen.dart';
import 'sign_in_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpacing(of: 80),
            Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.16),
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.height * 0.25,
                child: Center(
                  child: SvgPicture.asset(
                      'assets/Illustrations/Illustrations_4.svg'),
                )),
            VerticalSpacing(of: 100),
            Text(
              "Sign into your account",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.017,
              ),
            ),
            SignInForm(),
            VerticalSpacing(),
            VerticalSpacing(of: 100),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Text.rich(
                      TextSpan(
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(fontWeight: FontWeight.w600),
                        text: "You do not have an account? ",
                        children: <TextSpan>[
                          TextSpan(
                            text: "Create a new account.",
                            style: TextStyle(color: kActiveColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignUpScreen(),
                                    ),
                                  ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            VerticalSpacing(),
          ],
        ),
      ),
    );
  }
}
