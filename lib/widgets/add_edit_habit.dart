import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/bloc/habit_cubit.dart';
import 'package:habit_tracker/core/custom_color.dart';
import 'package:habit_tracker/models/habit_model.dart';
import 'package:habit_tracker/widgets/custom_dropdown_button.dart';

class AddEditHabit extends StatefulWidget {
  final HabitModel? habit;
  const AddEditHabit({
    super.key,
    this.habit,
  });

  @override
  State<AddEditHabit> createState() => _AddEditHabitState();
}

class _AddEditHabitState extends State<AddEditHabit> {
  String dropdownValue = '30';
  String dropdownValue2 = '1';

  List<List<String>> items = [
    ['30', '1 month (30 days)'],
    ['90', '3 months (90 days)'],
    ['180', '6 months (180 days)'],
    ['365', '1 year (365 days)'],
  ];

  List<List<String>> items2 = [
    ['1', 'Everyday'],
    ['2', 'Every 2 days'],
    ['3', 'Every 3 days'],
    ['4', 'Every 4 days'],
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

  TextEditingController goalController = TextEditingController();
  TextEditingController habitNameController = TextEditingController();

  @override
  void initState() {
    goalController.text = widget.habit?.goal ?? '';
    habitNameController.text = widget.habit?.habitName ?? '';
    super.initState();
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
                Text(widget.habit != null ? 'Edit Habit Goal' : 'Create New Habit Goal', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomTextInput(text: 'Your Goal', controller: goalController),
            const SizedBox(height: 20),
            CustomTextInput(text: 'Habit Name', controller: habitNameController),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Period Time', style: TextStyle(fontSize: 14, color: CustomColor.text, fontWeight: FontWeight.w600)),
                CustomDropdownButton(
                  dropdownValue: dropdownValue,
                  onChanged: updateValue,
                  items: items,
                ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (widget.habit == null) {
                        context.read<HabitCubit>().addHabit(HabitModel(
                        goal: goalController.text,
                        habitName: habitNameController.text,
                        period: int.parse(dropdownValue),
                        step: int.parse(dropdownValue2),
                        count: 0,
                        updatedDate: DateTime.now().subtract(const Duration(days: 1)),
                        createdDate: DateTime.now(),
                      ),);
                      } else {
                        context.read<HabitCubit>().updateHabit(
                              widget.habit!.copyWith(
                                goal: goalController.text,
                                habitName: habitNameController.text,
                                period: int.parse(dropdownValue),
                                step: int.parse(dropdownValue2),
                                updatedDate: DateTime.now(),
                              ),
                              widget.habit!,
                            );
                        // context.read<HabitCubit>().removeHabit(widget.habit!);
                      }
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                      backgroundColor: CustomColor.yellowText,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                      child: Text(widget.habit != null ? 'Update' : 'Create Habit', style: const TextStyle(color: CustomColor.bgColor, fontSize: 16, fontWeight: FontWeight.w800)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (widget.habit != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)), backgroundColor: Colors.white, elevation: 0),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                        child: Text('Delete', style: TextStyle(color: CustomColor.text, fontSize: 16, fontWeight: FontWeight.w800)),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class CustomTextInput extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  const CustomTextInput({
    super.key,
    required this.text,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: const TextStyle(fontSize: 14, color: CustomColor.text, fontWeight: FontWeight.w600)),
        const SizedBox(height: 10),
        TextField(
          controller: controller,
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
