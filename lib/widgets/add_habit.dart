import 'package:flutter/material.dart';
import 'package:habit_tracker/core/custom_color.dart';
import 'package:habit_tracker/widgets/custom_dropdown_button.dart';

class AddHabit extends StatefulWidget {
  const AddHabit({
    super.key,
  });

  @override
  State<AddHabit> createState() => _AddHabitState();
}

class _AddHabitState extends State<AddHabit> {
  String dropdownValue = '1 month (30 days)';
  String dropdownValue2 = 'Everyday';

  List<List<String>> items = [
    ['1 month (30 days)', '1 month (30 days)'],
    ['3 months (90 days)', '3 months (90 days)'],
    ['6 months (180 days)', '6 months (180 days)'],
    ['1 year (365 days)', '1 year (365 days)'],
  ];

  List<List<String>> items2 = [
    ['Everyday', 'Everyday'],
    ['Every 2 days', 'Every 2 days'],
    ['Every 3 days', 'Every 3 days'],
    ['Every 4 days', 'Every 4 days'],
  ];

  void updateValue(String? value) {
    setState(() {
      dropdownValue = value!;
    });
  }

  void updateValue2(String? value) {
    setState(() {
      dropdownValue2 = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(color: CustomColor.bgColor, borderRadius: BorderRadius.circular(6)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Create New Habit Goal', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const CustomTextInput(text: 'Your Goal'),
            const SizedBox(height: 20),
            const CustomTextInput(text: 'Habit Name'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Period Time', style: TextStyle(fontSize: 14, color: CustomColor.text, fontWeight: FontWeight.w600)),
                CustomDropdownButton(dropdownValue: dropdownValue, onChanged: updateValue, items: items),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Habit Type', style: TextStyle(fontSize: 14, color: CustomColor.text, fontWeight: FontWeight.w600)),
                CustomDropdownButton(dropdownValue: dropdownValue2, onChanged: updateValue2, items: items2),
              ],
            ),
            const SizedBox(height: 20),
            
          ],
        ),
      ),
    );
  }
}

class CustomTextInput extends StatelessWidget {
  final String text;
  const CustomTextInput({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: const TextStyle(fontSize: 14, color: CustomColor.text, fontWeight: FontWeight.w600)),
        const SizedBox(height: 10),
        TextField(
          cursorColor: CustomColor.yellowText,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: CustomColor.yellowText, width: 1), borderRadius: BorderRadius.circular(4)),
            enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: CustomColor.stroke, width: 1), borderRadius: BorderRadius.circular(4)),
            border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.red, width: 10), borderRadius: BorderRadius.circular(4)),
          ),
        ),
      ],
    );
  }
}
