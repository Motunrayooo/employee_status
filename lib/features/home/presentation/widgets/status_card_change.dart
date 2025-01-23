import 'package:employee_status/core/enum.dart';
import 'package:employee_status/core/utils/extensions.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

import 'details_tile.dart';

class StatusCardChange extends StatelessWidget {
  const StatusCardChange(
      {super.key,
      required this.productivityScore,
      required this.currentLevel,
      required this.newStatus,
      required this.newLevel,
        required this.newSalary,
      });

  final double productivityScore;
  final int currentLevel;
  final EmploymentStatus newStatus;
  final int newLevel;
  final String newSalary;

  @override
  Widget build(BuildContext context) {

    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: _getStatusColor(newStatus), // Border color
          width: 1, // Border width
        ),
        borderRadius: BorderRadius.circular(10.0), // Border radius
      ),
      color: Colors.white,
      // color: _getStatusColor(newStatus),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 6.h,
        ),
        child: Column(
          children: [
            Text(
              _getStatusMessage(),
              style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.black,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            if(newStatus != EmploymentStatus.termination)
            8.hi,
            DetailsTile(
              prefix: 'New Salary:',
              suffix: '₦$newSalary',
              prefixColor: AppColors.black,
              suffixColor:  AppColors.black,
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(EmploymentStatus status) {
    switch (status) {
      case EmploymentStatus.promotion:
        return Colors.green;
      case EmploymentStatus.noChange:
        return Colors.blue;
      case EmploymentStatus.demotion:
        return Colors.deepOrange;
      case EmploymentStatus.termination:
        return Colors.red;
    }
  }

  String _getStatusMessage() {
    switch (newStatus) {
      case EmploymentStatus.promotion:
        return "Congratulations! Based on the productivity score of $productivityScore, You have been promoted from level $currentLevel to level $newLevel";
      case EmploymentStatus.noChange:
        return "Your productivity score of $productivityScore indicates maintaining current Level $currentLevel";
      case EmploymentStatus.demotion:
        if (currentLevel == 0) {
          return "Warning: With a productivity score of $productivityScore and being at level 0, you might face a termination";
        }
        return "Warning: Productivity score of $productivityScore indicates a demotion from level $currentLevel to level $newLevel";
      case EmploymentStatus.termination:
        return "Critical: With a productivity score of $productivityScore, your employment has been TERMINATED";
    }
  }
}
