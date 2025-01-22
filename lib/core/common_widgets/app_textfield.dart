import 'package:employee_status/core/utils/app_colors.dart';
import 'package:employee_status/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  AppTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.onChanged
  });

  final String hintText;
  TextEditingController? controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      style: context.textTheme.bodySmall?.copyWith(color: AppColors.white),
      decoration: InputDecoration(

          contentPadding: EdgeInsets.only(
            bottom: 8.h,
          ),
          hintText: hintText,
          hintStyle: context.textTheme.bodySmall
              ?.copyWith(color: AppColors.white.withOpacity(0.6)),
          isDense: true,

          prefixIcon: Padding(
            padding: EdgeInsets.only(
              top: 5.h,
            ),
            child: Icon(
              Icons.search,
              color: AppColors.white.withOpacity(0.6),
              size: 24.h,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.white,
              width: 1.1.w,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10.r),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.secondaryColor,
              width: 1.1.w,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10.r),
            ),
          )),
    );
  }
}
