import 'package:equatable/equatable.dart';

class HabitModel extends Equatable {
  final String habitName;
  final String goal;
  final int period;
  final int step;
  final int count;
  final DateTime updatedDate;
  final DateTime createdDate;

  const HabitModel({
    required this.habitName,
    required this.goal,
    required this.period,
    required this.step,
    required this.count,
    required this.updatedDate,
    required this.createdDate,
  });

  HabitModel copyWith({
    String? habitName,
    String? goal,
    int? period,
    int? step,
    int? count,
    DateTime? updatedDate,
    DateTime? createdDate,
    // TODO: Created logic to update count
    bool? isChecked,
  }) {
    return HabitModel(
      habitName: habitName ?? this.habitName,
      goal: goal ?? this.goal,
      period: period ?? this.period,
      step: step ?? this.step,
      count: count ?? this.count,
      updatedDate: updatedDate ?? this.updatedDate,
      createdDate: createdDate ?? this.createdDate,
    );
  }

  factory HabitModel.fromJson(Map<String, dynamic> json) {
    return HabitModel(
      habitName: json['habitName'],
      goal: json['goal'],
      period: json['period'],
      step: json['step'],
      count: json['count'],
      updatedDate: DateTime.parse(json['updatedDate']),
      createdDate: DateTime.parse(json['createdDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'habitName': habitName,
      'goal': goal,
      'period': period,
      'step': step,
      'count': count,
      'updatedDate': updatedDate.toIso8601String(),
      'createdDate': createdDate.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [habitName, goal];
}
