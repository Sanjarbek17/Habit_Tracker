import 'package:habit_tracker/models/habit_model.dart';

class HabitState {
  final List<HabitModel> habits;

  HabitState({required this.habits});

  HabitState copyWith(List<HabitModel> habits) {
    return HabitState(habits: habits);
  }
}