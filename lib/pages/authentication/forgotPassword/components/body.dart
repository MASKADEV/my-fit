import 'package:flutter/material.dart';
import '../../../../components/widgets/welcome_text.dart';
import 'package:todo_fitness/pages/authentication/forgotPassword/reset_email_sent_screen.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/size_config.dart';
import '../../../../components/buttons/primary_button.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VerticalSpacing(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          ForgotPassForm(),
        ],
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({
    Key? key,
  }) : super(key: key);

  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String? _email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Email Field
          TextFormField(
            autovalidate: _autoValidate,
            validator: emailValidator,
            onSaved: (value) => _email = value,
            style: kSecondaryBodyTextStyle,
            cursorColor: kActiveColor,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Email Address",
              contentPadding: kTextFieldPadding,
            ),
          ),
          VerticalSpacing(),

          // Reset password Button
          PrimaryButton(
            text: "Réinitialiser le mot de passe",
            press: () async {
              if (_formKey.currentState!.validate()) {
                // If all data are correct then save data to out variables
                _formKey.currentState!.save();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResetEmailSentScreen(
                        email: _email!,
                      ),
                    ));
              } else {
                // If all data are not valid then start auto validation.
                setState(() {
                  _autoValidate = true;
                });
              }
            },
          )
        ],
      ),
    );
  }
}
