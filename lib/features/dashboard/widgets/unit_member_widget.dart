import 'package:falconnet/theme/src/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UnitMemberWidget extends StatelessWidget {
  final String name;
  final String room_num;
  final bool accountability;

  const UnitMemberWidget(this.name, this.room_num, this.accountability, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 2, child: Text(name, textAlign: TextAlign.left, style: AppTextStyles.h2)),
        Expanded(flex: 2, child: Text(room_num, textAlign: TextAlign.center, style: AppTextStyles.h2)),
        Expanded(flex: 2, child: Text(accountability ? "In" : "Out", textAlign: TextAlign.center, style: AppTextStyles.h2)),
        Expanded(flex: 1, child: Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {},
                child: Text("Sign", style: AppTextStyles.h2)
            ),
          ),
        )),
      ],
    );
  }
}

class UnitMemberWidgetHeading extends StatelessWidget {
  const UnitMemberWidgetHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 2, child: Text("Name", textAlign: TextAlign.left, style: AppTextStyles.h2)),
        Expanded(flex: 2, child: Text("Room #", textAlign: TextAlign.center, style: AppTextStyles.h2)),
        Expanded(flex: 2, child: Text("Pass Status", textAlign: TextAlign.center, style: AppTextStyles.h2)),
        const Expanded(flex: 1, child: Spacer())
      ],
    );
  }
}