import 'package:falconnet/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../theme/src/app_text_styles.dart';

class UnitPage extends ConsumerWidget {
  const UnitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: InkWell(
                onTap: () => GoRouter.of(context).goNamed(RouteNames.dashboard),
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'assets/icons/back.png',
                  width: 40,
                ),
              ),
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
