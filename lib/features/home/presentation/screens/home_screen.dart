import 'package:employee_status/core/utils/extensions.dart';
import 'package:employee_status/core/utils/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common_widgets/app_textfield.dart';
import '../../../../core/common_widgets/app_loader.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/themes/app_theme.dart';
import '../../logic/employee_notifier.dart';
import '../widgets/employee_tile.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(employeeStateProvider.notifier).fetchEmployees();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final employees = ref.watch(employeeStateProvider);
    final isLoading = ref.watch(employeeStateProvider.notifier).state.isEmpty;
    final filter = ref.watch(filterStateProvider);
    final filterEmployees = employees.where((employee) {
      final name = '${employee.firstName} ${employee.lastName}'.toLowerCase();
      final designation = employee.designation?.toLowerCase();
      final level = employee.level.toString();
      return name.contains(filter.toLowerCase()) ||
          designation!.contains(filter.toLowerCase()) ||
          level.contains(filter);
    }).toList();

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        automaticallyImplyLeading: false,
        elevation: 4,
        centerTitle: true,
        shadowColor: Colors.black.withOpacity(0.5),
        title: Text(
          'XYZ inc. Employees ',
          style: context.textTheme.bodyMedium?.copyWith(
            color: AppColors.white,
            fontFamily: AppTheme.merienda,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              try {
                await ref.read(employeeStateProvider.notifier).simulateError();
              } catch (e) {
                showSnackBar(context, e.toString());
              }
            },
            icon: const Icon(
              Icons.error,
              color: AppColors.secondaryColor,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              20.hi,
              isLoading
                  ? const AppLoader()
                  : Column(
                      children: [
                        20.hi,
                        AppTextField(
                          hintText: 'Name, designation or level',
                          controller: searchController,
                          onChanged: (val) {
                            ref.read(filterStateProvider.notifier).state = val;
                          },
                        ),
                        20.hi,
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.8,
                          child: ListView.builder(
                            itemCount: filterEmployees.length,
                            itemBuilder: (context, index) {
                              final employee = filterEmployees[index];

                              return EmployeeTile(
                                onTap: () {
                                  ref
                                      .read(employeeIdStateProvider.notifier)
                                      .state = employee.id ?? 0;

                                  context.go('/details');
                                },
                                name:
                                    '${employee.firstName} ${employee.lastName}',
                                designation: employee.designation ?? '',
                                level: employee.level.toString(),
                              ).padVertical(10);
                            },
                          ),
                        ),
                      ],
                    ),
            ],
          ).padHorizontal(16),
        ),
      ),
    );
  }
}
