import 'package:flutter/material.dart';
import 'package:todo_fitness/pages/authentication/signIn/sign_in_screen.dart';
import 'package:todo_fitness/utils/size_config.dart';

import '../../../utils/constants.dart';
import '../../../components/buttons/primary_button.dart';
import '../../../components/widgets/dot_indicators.dart';
import 'onboard_content.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Column(
        children: [
          Spacer(flex: 2),
          Expanded(
            flex: 14,
            child: PageView.builder(
              itemCount: Details.length,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemBuilder: (context, index) => OnboardContent(
                illustration: Details[index]["illustration"],
                title: Details[index]["title"],
                text: Details[index]["text"],
              ),
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(Details.length,
                (index) => DotIndicator(isActive: index == currentPage)),
          ),
          Spacer(flex: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: PrimaryButton(
              press: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              },
              text: "Commencer",
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

// Demo data for our Onboarding screen
List<Map<String, dynamic>> Details = [
  {
    "illustration": "assets/Illustrations/Illustrations_1.svg",
    "title": "Organize it all",
    "text":
        "No matter who you are and what you do - you will be better organized!",
  },
  {
    "illustration": "assets/Illustrations/Illustrations_2.svg",
    "title": "Plane Your week with one Click",
    "text": "It is truly usable with great user experience.",
  },
  {
    "illustration": "assets/Illustrations/Illustrations_3.svg",
    "title": "Stay organized from your phone",
    "text":
        "At home, at work and in your free time - you will focus on really important things!",
  },
];
