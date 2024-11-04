import 'package:flutter/material.dart';
import 'package:habit_tracker/core/custom_color.dart';
import 'package:habit_tracker/models/habit_model.dart';

class ProgressCard extends StatelessWidget {
  final HabitModel habit;
  const ProgressCard({
    super.key,
    required this.habit,
  });

  @override
  Widget build(BuildContext context) {
    bool isAchieved = habit.count >= habit.period;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: CustomColor.cardbg),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${((habit.count / habit.period) * 100).toStringAsFixed(0)}%',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isAchieved ? CustomColor.green : CustomColor.greyText,
              ),
            ),
            Column(
              children: [
                Text(habit.habitName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: CustomColor.text)),
                Text('${habit.count} from ${habit.period} days target', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: CustomColor.text)),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: isAchieved ? CustomColor.greenbg : Colors.transparent,
              ),
              child: Text(
                isAchieved ? 'Achieved' : 'Unachieved',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: isAchieved ? CustomColor.green : CustomColor.greyText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
