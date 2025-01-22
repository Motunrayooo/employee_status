import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/home/data/models/employee_res_model.dart';


class EmployeeLocalStorage {
  static const _employeeKey = "employee";

  static Future<void> saveEmployees(List<EmployeeResModel> employees) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = employees.map((e) => e.toJson()).toList();
    prefs.setStringList(
        _employeeKey, jsonList.map((e) => jsonEncode(e)).toList());
  }

  static Future<List<EmployeeResModel>> getEmployees() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList(_employeeKey) ?? [];
    return jsonList
        .map((e) => EmployeeResModel.fromJson(jsonDecode(e)))
        .toList();
  }
}
