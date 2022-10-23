import 'package:falconnet/features/dashboard/widgets/unit_stats_widget.dart';
import 'package:falconnet/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My Unit:',
                      textAlign: TextAlign.start,
                      style: AppTextStyles.h2,
                    ),
                    const SizedBox(height: 10),
                    const UnitStatsWidget(),
                    const UnitStatsWidget(),
                    const UnitStatsWidget(),
                  ],
                ),
                const SizedBox(width: 100),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Accountability Dashboard',
                      textAlign: TextAlign.start,
                      style: AppTextStyles.h2,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      height: 500,
                      width: 800,
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
