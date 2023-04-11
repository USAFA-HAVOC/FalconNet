import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../Theme/NegativeButtonTheme.dart';

class PasswordDialog extends StatefulWidget {
  final void Function() onSucceed;
  final void Function() onCancel;

  const PasswordDialog({super.key, required this.onSucceed, required this.onCancel});

  @override
  State<StatefulWidget> createState() => PasswordDialogState();
}

class PasswordDialogState extends State<PasswordDialog> {
  TextEditingController controller = TextEditingController(text: "");
  String? validation;

  @override
  Widget build(BuildContext context) => Dialog(
    child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Enter Credentials",
                style: Theme.of(context).textTheme.titleMedium,
              ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Developer settings will not grant you any additional privileges "
              "or access. Modifying them without understanding will not affect "
              "the server, but may potentially break the client.",
            ),
          ),

          TextField(
            controller: controller,
            onChanged: (change) => setState(() => validation = null),
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).dividerColor),
                    borderRadius: BorderRadius.circular(10)
                ),
                errorText: validation,
                labelStyle: Theme.of(context).textTheme.bodyLarge,
                labelText: "Password",
                suffixIcon: const Icon(Icons.password)
            ),
          ),

          Row(
            children: [
              Expanded(
                flex: 4,
                child: ElevatedButton(
                  style: Theme.of(context).extension<NegativeButtonTheme>()!.style,
                  onPressed: () => context.pop(),
                  child: const Text("Cancel"),
                ),
              ),

              const Spacer(flex: 1,),

              Expanded(
                flex: 4,
                child: ElevatedButton(
                  onPressed: () {
                    if (controller.text == "dev-fn") {
                      context.pop();
                      widget.onSucceed();
                    }
                    else {
                      validation = "Password Incorrect";
                    }
                  },
                  child: const Text("Submit"),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}