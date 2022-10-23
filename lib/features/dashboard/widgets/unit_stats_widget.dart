import 'package:flutter/material.dart';

import '../../../theme/src/app_text_styles.dart';

class UnitStatsWidget extends StatelessWidget {
  const UnitStatsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 65,
            width: 65,
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                const CircularProgressIndicator(
                  value: 0.4,
                  strokeWidth: 12,
                  backgroundColor: Color(0xffABCAF9),
                  valueColor: AlwaysStoppedAnimation(Color(0xff3D8AFF)),
                ),
                Center(
                  child: Text('90%', textAlign: TextAlign.center, style: AppTextStyles.h2),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Column(
            children: [
              const Text('Cadet Squadron 25'),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Members\nAssigned',
                    style: AppTextStyles.p5,
                  ),
                  const SizedBox(width: 15),
                  Text('90', style: AppTextStyles.h2),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
