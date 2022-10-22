import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../theme/theme.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: Center(
          child: Text(
            'Something will go here for the homepage...',
            textAlign: TextAlign.center,
            style: AppTextStyles.bold,
          ),
        ),
      ),
    );
  }
}
