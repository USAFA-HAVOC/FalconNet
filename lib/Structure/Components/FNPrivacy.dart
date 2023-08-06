import 'package:flutter/material.dart';

class FNPrivacy extends StatelessWidget {
  const FNPrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ListView(
        primary: false,
        shrinkWrap: true,
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: CloseButton(),
          ),

          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "FalconNet Privacy Statement",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  SizedBox(height: 20,),

                  const Text(
                      "Privacy statement goes here"
                  )
                ],
              )
          ),
        ],
      ),
    );
  }
}