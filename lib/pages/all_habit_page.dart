import 'package:flutter/material.dart';
import 'package:habit_tracker/core/custom_color.dart';
import 'package:habit_tracker/models/habit_model.dart';
import 'package:habit_tracker/widgets/habits_widget.dart';

class AllHabitPage extends StatelessWidget {
  final List<HabitModel> habitList;
  const AllHabitPage({super.key, required this.habitList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.bgColor,
      appBar: AppBar(
        title: const Text('All Habits'),
        backgroundColor: CustomColor.bgColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: HabitsWidget(habitList: habitList),
        ),
      ),
    );
  }
}
