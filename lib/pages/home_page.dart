import 'package:flutter/material.dart';
import 'package:habit_tracker/core/custom_color.dart';
import 'package:habit_tracker/gen/assets.gen.dart';
import 'package:habit_tracker/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.bgColor,
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
                  image: DecorationImage(
                    image: Assets.images.group170.provider(),
                    fit: BoxFit.cover,
                  ),
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
              Container(
                decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text("Today's Habits", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: const Text('See All', style: TextStyle(color: CustomColor.yellowText)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const CustomCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
