import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_tracker/bloc/habit_cubit.dart';
import 'package:habit_tracker/bloc/habit_state.dart';
import 'package:habit_tracker/core/custom_color.dart';
import 'package:habit_tracker/gen/assets.gen.dart';
import 'package:habit_tracker/widgets/progress_card.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int count = 0;
    return BlocBuilder<HabitCubit, HabitState>(
      builder: (context, state) {
        state.habits.map((habit) {
          if (habit.count >= habit.period) {
            count++;
          }
        });
        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Your goals', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
                  Text('See All', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: CustomColor.yellowText)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Text('${((count / state.habits.length) * 100).toStringAsFixed(0)}%', style: const TextStyle(fontSize: 46, fontWeight: FontWeight.w800, color: CustomColor.yellowText)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Assets.icons.check2),
                      Text("$count Habits goal has achieved", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: CustomColor.yellowText)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Assets.icons.close),
                      Text("${state.habits.length - count} Habits goal hasn’t achieved", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: CustomColor.greyText)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ListView.builder(
              itemCount: state.habits.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ProgressCard(habit: state.habits[index]);
              },
            ),
            const SizedBox(height: 20),
            const Text('See All', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: CustomColor.yellowText)),
          ],
        );
      },
    );
  }
}
