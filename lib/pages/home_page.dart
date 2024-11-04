import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/core/custom_color.dart';
import 'package:habit_tracker/gen/assets.gen.dart';
import 'package:habit_tracker/models/habit_model.dart';
import 'package:habit_tracker/pages/all_habit_page.dart';
import 'package:habit_tracker/widgets/add_edit_habit.dart';
import 'package:habit_tracker/widgets/habits_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<HabitModel> habitList = const [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.bgColor,
      floatingActionButton: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => const AddEditHabit(),
          );
        },
        borderRadius: BorderRadius.circular(50),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), boxShadow: [BoxShadow(color: CustomColor.green.withOpacity(0.4), spreadRadius: -5, blurRadius: 5, offset: const Offset(0, 3))]),
          child: SvgPicture.asset(Assets.icons.plus),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 13.0, left: 13.0, right: 13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Sun, 1 March 2022', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              const Text('Habit Tracker', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
              const SizedBox(height: 20),
              Container(
                height: 190,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(image: Assets.images.group170.provider(), fit: BoxFit.cover),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.white, size: 40),
                    SizedBox(width: 10),
                    Text('3 of 5 habits \ncompleted today!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              HabitsWidget(
                habitList: habitList.getRange(0, 3).toList(),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllHabitPage(
                        habitList: habitList,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
