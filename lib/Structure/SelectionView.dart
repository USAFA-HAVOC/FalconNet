import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

import '../Model/Store/Endpoints.dart';

class SelectionView extends StatelessWidget {
  final Function() onSigned;
  final Function() onDemo;

  const SelectionView({Key? key, required this.onSigned, required this.onDemo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 200.0,
            height: 50.0,
            child: SignInButton(
              Buttons.Microsoft,
              text: "Sign in with USAFA",
              onPressed: () async {
                await attemptLogin();
                onSigned();
              },
            ),
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            width: 200.0,
            height: 50.0,
            child: SignInButton(
              Buttons.Apple,
              text: "Demo Mode (Apple)",
              onPressed: () async {
                onDemo();
              },
            ),
          ),
        ],
      ),
    );
  }
}
