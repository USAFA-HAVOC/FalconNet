import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../theme/src/app_text_styles.dart';
import '../widgets/unit_stats_widget.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: const [
                UnitStatsWidget(),
                UnitStatsWidget(),
                UnitStatsWidget(),
              ],
            ),
            const SizedBox(width: 100),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 500,
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Unit Members:',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.h2.copyWith(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
