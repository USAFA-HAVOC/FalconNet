import 'package:flutter/material.dart';

import '../theme/src/app_text_styles.dart';

class DashboardWrapper extends StatelessWidget {
  const DashboardWrapper({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'My Unit:',
                      textAlign: TextAlign.start,
                      style: AppTextStyles.h2,
                    ),
                  ),
                  const SizedBox(width: 100),
                  Expanded(
                    child: Text(
                      'Accountability Dashboard',
                      textAlign: TextAlign.start,
                      style: AppTextStyles.h2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
