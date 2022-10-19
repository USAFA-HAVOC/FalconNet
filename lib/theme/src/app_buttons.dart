import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_shadows.dart';
import 'app_text_styles.dart';

class AppButtons {
  static Widget primary({
    required VoidCallback? onTap,
    required Widget child,
    Color? fillColor,
    Color? textColor,
  }) {
    final decoration = BoxDecoration(
      color: fillColor ?? (onTap == null ? Colors.grey[300] : AppColors.primary),
      border: Border.all(
        width: 1,
        color: fillColor ?? (onTap == null ? Colors.grey[300]! : AppColors.primary),
      ),
      borderRadius: BorderRadius.circular(12),
      boxShadow: [AppShadows.primary],
    );

    return Ink(
      decoration: decoration,
      child: InkWell(
        onTap: onTap,
        highlightColor: textColor?.withOpacity(0.15) ?? AppColors.text.withOpacity(0.15),
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: Center(
            child: DefaultTextStyle.merge(
              style: AppTextStyles.p1.copyWith(color: textColor ?? AppColors.text),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
