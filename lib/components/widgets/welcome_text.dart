import 'package:flutter/material.dart';
import 'package:todo_fitness/utils/constants.dart';

import 'package:todo_fitness/utils/size_config.dart';

class WelcomeText extends StatelessWidget {
  final String title, text;

  const WelcomeText({Key? key, required this.title, required this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VerticalSpacing(of: 10),
        Text(
          title,
          style: kH1TextStyle,
        ),
        VerticalSpacing(of: 3),
        Text(text, style: kBodyTextStyle),
        VerticalSpacing(),
      ],
    );
  }
}
