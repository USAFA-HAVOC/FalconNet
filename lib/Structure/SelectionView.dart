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
              onPressed: () => showDialog(
                context: context,
                builder: (context) => Dialog(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListView(
                      shrinkWrap: true,
                      primary: false,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "FalcontNet Data Consent",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),

                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                              "You are accessing an Information System (IS) that is provided for United States"
                              " Air Force Academy-authorized use only. To learn"
                              " more about how FalconNet uses permissions and connections granted by the user, "
                              "please read FalconNet's Privacy Policy and Transparency Guide. "
                              "When you select 'Accept' or access FalconNet affiliated data sources "
                              "you are agreeing to FalconNet's Terms of Use."
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: ElevatedButton(
                              onPressed: () async {
                                Navigator.of(context).pop();
                                await attemptLogin();
                                onSigned();
                              },
                              child: const Text(
                                "Accept",
                                style: TextStyle(color: Colors.white),
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ),
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
