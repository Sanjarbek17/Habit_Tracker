import 'package:flutter/material.dart';
import 'package:habit_tracker/core/custom_color.dart';
import 'package:habit_tracker/widgets/custom_check.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100,
          width: MediaQuery.sizeOf(context).width - 40,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: const BoxDecoration(color: CustomColor.lightGreen, borderRadius: BorderRadius.all(Radius.circular(10))),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Meditating', style: TextStyle(fontSize: 20, color: CustomColor.green, fontWeight: FontWeight.w600)),
              CustomCheckBox(),
            ],
          ),
        )
      ],
    );
  }
}
