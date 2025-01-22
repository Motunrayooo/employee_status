import 'package:employee_status/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/themes/app_theme.dart';

class EmployeeTile extends StatelessWidget {
  const EmployeeTile({
    required this.onTap,
    required this.name,
    required this.designation,
    required this.level,
    super.key,
  });

  final void Function()? onTap;
  final String name, designation, level;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 10.w,
          horizontal: 12.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.primaryShade900,
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: context.textTheme.bodySmall?.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w500,

              ),
            ),
            4.hi,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  designation,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: AppColors.white.withOpacity(0.6),
                    fontSize: 14.sp,
                    fontFamily: AppTheme.merienda,
                  ),
                ),
                Text(
                  'Level: $level',
                  style: context.textTheme.bodySmall?.copyWith(
                    color: AppColors.white.withOpacity(0.6),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
