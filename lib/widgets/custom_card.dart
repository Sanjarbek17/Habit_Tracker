import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/bloc/habit_cubit.dart';
import 'package:habit_tracker/core/custom_color.dart';
import 'package:habit_tracker/models/habit_model.dart';
import 'package:habit_tracker/widgets/add_edit_habit.dart';
import 'package:habit_tracker/widgets/custom_check.dart';

class CustomCard extends StatefulWidget {
  final HabitModel habit;
  const CustomCard({
    super.key,
    required this.habit,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isSelected = false;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    isChecked = widget.habit.updatedDate.day == DateTime.now().day;
    return Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.only(bottom: 17.0),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Row(
            children: [
              Container(
                height: 60,
                width: MediaQuery.sizeOf(context).width - 40,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: isChecked ? CustomColor.lightGreen : CustomColor.cardbg,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  children: [
                    Text(widget.habit.habitName, style: TextStyle(fontSize: 20, color: isChecked ? CustomColor.green : CustomColor.text, fontWeight: FontWeight.w600)),
                    const Spacer(),
                    CustomCheckBox(
                      isChecked: isChecked,
                      onTap: () {
                        context.read<HabitCubit>().updateHabit(
                              widget.habit.copyWith(
                                updatedDate: isChecked
                                    ? DateTime.now().subtract(
                                        const Duration(days: 1),
                                      )
                                    : DateTime.now(),
                                count: isChecked ? widget.habit.count - 1 : widget.habit.count + 1,
                              ),
                              widget.habit,
                            );
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      child: const Icon(Icons.more_vert),
                    )
                  ],
                ),
              ),
            ],
          ),
          if (isSelected)
            TapRegion(
              onTapOutside: (event) {
                setState(() {
                  isSelected = false;
                });
              },
              child: Container(
                width: 90,
                height: 60,
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 1, blurRadius: 5, offset: const Offset(0, 3))],
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AddEditHabit(
                              habit: widget.habit,
                            ),
                          );
                        },
                        child: const Row(
                          children: [
                            Text('Edit', style: TextStyle(color: CustomColor.greyText, fontSize: 12, fontWeight: FontWeight.w600)),
                          ],
                        )),
                    InkWell(
                      onTap: () {
                        context.read<HabitCubit>().removeHabit(widget.habit);
                        setState(() {
                          isSelected = false;
                        });
                      },
                      child: const Row(
                        children: [
                          Text('Delete', style: TextStyle(color: CustomColor.greyText, fontSize: 12, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
