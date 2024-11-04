import 'dart:convert';

import 'package:habit_tracker/models/habit_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HabitRepository {
  final SharedPreferences prefs;

  HabitRepository({required this.prefs});

  Future<void> addOrRemoveHabit(List<HabitModel> habits) async {
    await prefs.setString('habits', jsonEncode(habits));
  }

  Future<List<HabitModel>> getHabits() async {
    final String? habits = prefs.getString('habits');
    if (habits == null) {
      return [];
    }
    final List<dynamic> habitList = jsonDecode(habits);
    return habitList.map((e) => HabitModel.fromJson(e)).toList();
  }
}