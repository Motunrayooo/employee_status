import 'package:employee_status/core/utils/extensions.dart';
import 'package:employee_status/features/home/presentation/widgets/status_card_change.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/themes/app_theme.dart';
import '../../logic/employee_notifier.dart';
import '../widgets/details_tile.dart';

class EmployeeDetailsScreen extends ConsumerWidget {
  const EmployeeDetailsScreen({super.key});

  // final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final employerDetails =
        ref.watch(employeeDetailsProvider(ref.watch(employeeIdStateProvider)));
    final newStatus = employerDetails.calculateNewStatus();
    final newLevel = employerDetails.calculateNewLevel();
    final newSalary = employerDetails.calculateNewSalary();
    return Scaffold(
        backgroundColor: AppColors.primaryColor.withOpacity(0.8),
        appBar: AppBar(
          backgroundColor: AppColors.primaryShade900,
          leading: InkWell(
            onTap: () {
              context.go('/home');
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              color: AppColors.primaryShade900,
            ),
          ),
          centerTitle: true,
          title: Text(
            'Employee\'s Details',
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.white,
              fontSize: 18.sp,
              fontFamily: AppTheme.merienda,
            ),
          ),
        ),
        body: Column(
          children: [
            100.hi,
            Material(
              elevation: 2,
              borderRadius: BorderRadius.all(
                Radius.circular(12.r),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 18.h,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primaryShade900,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.r),
                  ),
                  border: Border.all(
                    color: AppColors.secondaryColor,
                    width: 0.7,
                  ),
                ),
                child: Column(
                  children: [
                    DetailsTile(
                      prefix: 'Name:',
                      suffix:
                          '${employerDetails.firstName} ${employerDetails.lastName}',
                    ),
                    14.hi,
                    DetailsTile(
                      prefix: 'Designation:',
                      suffix: employerDetails.designation ?? '',
                    ),
                    14.hi,
                    DetailsTile(
                      prefix: 'Level:',
                      suffix: employerDetails.level.toString(),
                    ),
                    14.hi,
                    DetailsTile(
                      prefix: 'Productivity Score:',
                      suffix: employerDetails.productivityScore.toString(),
                    ),
                    14.hi,
                    DetailsTile(
                      prefix: 'Current Salary:',
                      suffix: '₦${employerDetails.currentSalary}',
                    ),
                    14.hi,
                    DetailsTile(
                      prefix: 'Employment Status:',
                      suffix: employerDetails.employmentStatus.toString(),
                    ),
                  ],
                ),
              ),
            ),
            20.hi,
            Text(
              'Status Change Summary',
              style: context.textTheme.bodySmall?.copyWith(
                  color: AppColors.white,
                  fontFamily: AppTheme.merienda,
                  fontWeight: FontWeight.w600),
            ),
            10.hi,
            StatusCardChange(
              productivityScore: employerDetails.productivityScore ?? 0.0,
              currentLevel: employerDetails.level ?? 0,
              newStatus: newStatus,
              newLevel: newLevel,
              newSalary: newSalary,
            )
          ],
        ).padHorizontal(16));
  }
}
