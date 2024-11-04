import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/core/custom_color.dart';
import 'package:habit_tracker/gen/assets.gen.dart';
import 'package:habit_tracker/widgets/custom_dropdown_button.dart';
import 'package:habit_tracker/widgets/progress_card.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  String dropdownValue = 'Today';

  List<List<String>> items = [
    ['Today', 'Today'],
    ['Yesterday', 'Yesterday'],
    ['Last 7 days', 'Last 7 days'],
    ['Last 30 days', 'Last 30 days'],
  ];

  void updateValue(String? value) {
    setState(() {
      dropdownValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('   Progress Page', style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Progress Report', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
              CustomDropdownButton(
                dropdownValue: dropdownValue,
                onChanged: updateValue,
                items: items,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: CustomColor.greyBg.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
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
                      const Text("60%", style: TextStyle(fontSize: 46, fontWeight: FontWeight.w800, color: CustomColor.yellowText)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(Assets.icons.check2),
                          const Text("11 Habits goal has achieved", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: CustomColor.yellowText)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(Assets.icons.close),
                          const Text("6 Habits goal hasn’t achieved", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: CustomColor.greyText)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const ProgressCard(title: 'Journaling everyday', subtitle: '7 from 7 days target'),
                const ProgressCard(title: 'Journaling everyday', subtitle: '7 from 7 days target'),
                const ProgressCard(title: 'Journaling everyday', subtitle: '7 from 7 days target'),
                const SizedBox(height: 20),
                const Text('See All', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: CustomColor.yellowText)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
