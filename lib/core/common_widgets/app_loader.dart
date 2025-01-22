import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utils/app_colors.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: const Column(
        children: [
          Spacer(),
          Center(
            child: SpinKitSpinningLines(
              color: AppColors.white,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
