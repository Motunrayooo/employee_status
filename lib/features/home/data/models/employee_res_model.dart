import 'package:employee_status/core/enum.dart';

class EmployeeResModel {
  EmployeeResModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.designation,
    required this.level,
    required this.productivityScore,
    required this.currentSalary,
    required this.employmentStatus,
  });

  final int? id;
  final String? firstName;
  final String? lastName;
  final String? designation;
  final int? level;
  final double? productivityScore;
  final String? currentSalary;
  final int? employmentStatus;

  factory EmployeeResModel.fromJson(Map<String, dynamic> json) {
    return EmployeeResModel(
      id: json["id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      designation: json["designation"],
      level: json["level"],
      productivityScore: json["productivity_score"],
      currentSalary: json["current_salary"],
      employmentStatus: json["employment_status"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "designation": designation,
        "level": level,
        "productivity_score": productivityScore,
        "current_salary": currentSalary,
        "employment_status": employmentStatus,
      };

  EmploymentStatus calculateNewStatus() {
    if (productivityScore! >= 80) {
      return EmploymentStatus.promotion;
    } else if (productivityScore! >= 50) {
      return EmploymentStatus.noChange;
    } else if (productivityScore! >= 40) {
      return EmploymentStatus.demotion;
    } else {
      return EmploymentStatus.termination;
    }
  }

  int calculateNewLevel() {
    final status = calculateNewStatus();
    if (status == EmploymentStatus.promotion && level! < 5) {
      return level! + 1;
    } else if (status == EmploymentStatus.demotion && level! > 0) {
      return level! - 1;
    }
    return level!;
  }

  String calculateNewSalary() {
    final newLevel = calculateNewLevel();
    switch (newLevel) {
      case 0:
        return "70,000";
      case 1:
        return "100,000";
      case 2:
        return "120,000";
      case 3:
        return "180,000";
      case 4:
        return "200,000";
      case 5:
        return "250,000";
      default:
        return currentSalary ?? '';
    }
  }
}
