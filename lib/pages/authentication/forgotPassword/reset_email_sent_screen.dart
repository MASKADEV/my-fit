import 'package:flutter/material.dart';
import 'package:todo_fitness/components/buttons/primary_button.dart';
import '../../../../components/widgets/welcome_text.dart';

import 'package:todo_fitness/utils/constants.dart';
import 'package:todo_fitness/utils/size_config.dart';

class ResetEmailSentScreen extends StatelessWidget {
  final String? email;
  ResetEmailSentScreen({this.email});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomeText(
                title: "Réinitialiser l'e-mail envoyé",
                text:
                    "Nous avons envoyé un e-mail d'instructions à \n${email}."),
            VerticalSpacing(),
            PrimaryButton(
              text: "Envoyer à nouveau",
              press: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
