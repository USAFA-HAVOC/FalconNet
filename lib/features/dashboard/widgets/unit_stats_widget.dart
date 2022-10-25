import 'package:falconnet/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../theme/src/app_text_styles.dart';

enum UnitType {
  squadron,
  group,
  wing
}

class UnitStatsWidget extends StatelessWidget {
  final String name;
  final double percent;
  final int members;

  const UnitStatsWidget(this.name, this.percent, this.members, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
        child: Material(
          color: const Color(0xffffffff),
          child: InkWell(
            onTap: () => GoRouter.of(context).pushNamed(RouteNames.unit),
            splashColor: Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
            hoverColor: const Color(0xfff9f9f9),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  SizedBox(
                    height: 65,
                    width: 65,
                    child: Stack(
                      fit: StackFit.expand,
                      alignment: Alignment.center,
                      children: [
                        CircularProgressIndicator(
                          value: percent / 100,
                          strokeWidth: 12,
                          backgroundColor: const Color(0xffABCAF9),
                          valueColor: const AlwaysStoppedAnimation(Color(0xff3D8AFF)),
                        ),
                        Center(
                          child: Text('$percent%', textAlign: TextAlign.center, style: AppTextStyles.h2),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: [
                      Text(name),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Members\nAssigned',
                            style: AppTextStyles.p5,
                          ),
                          const SizedBox(width: 15),
                          Text('$members', style: AppTextStyles.h2),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
