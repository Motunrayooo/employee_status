import 'package:employee_status/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class DetailsTile extends StatelessWidget {
  const DetailsTile({
    required this.prefix,
    required this.suffix,
    this.prefixColor,
    this.suffixColor,
    super.key,
  });

  final String prefix, suffix;
  final Color? prefixColor, suffixColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          prefix,
          style: context.textTheme.bodySmall
              ?.copyWith(color: prefixColor ?? AppColors.white.withOpacity(0.5)),
        ),
        Text(
          suffix,
          style: context.textTheme.bodySmall?.copyWith(
            color: suffixColor ?? AppColors.white,
            fontSize: 17.sp,
          ),
        ),
      ],
    );
  }
}