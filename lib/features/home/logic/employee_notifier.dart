import 'package:employee_status/core/io/data.dart';
import 'package:employee_status/features/home/data/models/employee_res_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/storage/employee_local_storage.dart';

class EmployeeNotifier extends StateNotifier<List<EmployeeResModel>> {
  EmployeeNotifier() : super([]);

  Future<void> fetchEmployees() async {
    await Future.delayed(const Duration(seconds: 2));
    final response = Api.successResponse;
    final data = response["data"] as List;
    state = data.map((e) => EmployeeResModel.fromJson(e)).toList();
    await EmployeeLocalStorage.saveEmployees(state);
  }

  Future<void> simulateError() async {
    await Future.delayed(const Duration(seconds: 2));
    final response = Api.errorRexponse;
    throw response["message"];
  }
}

final filterStateProvider = StateProvider.autoDispose((ref) => '');
final employeeIdStateProvider = StateProvider<int>((ref) => 0);

final employeeStateProvider =
    StateNotifierProvider.autoDispose<EmployeeNotifier, List<EmployeeResModel>>(
  (ref) => EmployeeNotifier(),
);

final employeeDetailsProvider =
    Provider.family<EmployeeResModel, int>((ref, id) {
  final employees = ref.watch(employeeStateProvider);
  return employees.firstWhere((element) => element.id == id);
});
