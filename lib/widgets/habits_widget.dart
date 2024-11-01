import 'package:flutter/material.dart';
import 'package:habit_tracker/core/custom_color.dart';
import 'package:habit_tracker/models/habit_model.dart';
import 'package:habit_tracker/widgets/custom_card.dart';

class HabitsWidget extends StatelessWidget {
  final void Function()? onTap;

  const HabitsWidget({
    super.key,
    required this.habitList,
    this.onTap,
  });

  final List<HabitModel> habitList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 22.0),
      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              children: [
                const Text("Today's Habits", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                const Spacer(),
                if (onTap != null)
                  TextButton(
                    onPressed: onTap,
                    child: const Text('See All', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: CustomColor.yellowText)),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          ListView.builder(
            itemCount: habitList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CustomCard(
                text: habitList[index].habitName,
                isChecked: habitList[index].isChecked,
              );
            },
          ),
        ],
      ),
    );
  }
}
