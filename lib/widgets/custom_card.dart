import 'package:flutter/material.dart';
import 'package:habit_tracker/core/custom_color.dart';
import 'package:habit_tracker/widgets/custom_check.dart';

class CustomCard extends StatefulWidget {
  final String text;
  final bool isChecked;
  const CustomCard({
    super.key,
    required this.text,
    required this.isChecked,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.centerRight,
          children: [
            Container(
              height: 100,
              width: MediaQuery.sizeOf(context).width - 40,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: const BoxDecoration(color: CustomColor.lightGreen, borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                children: [
                  Text(widget.text, style: const TextStyle(fontSize: 20, color: CustomColor.green, fontWeight: FontWeight.w600)),
                  const Spacer(),
                  CustomCheckBox(isChecked: widget.isChecked),
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
            if (isSelected)
              TapRegion(
                onTapOutside: (event) {
                  setState(() {
                    isSelected = false;
                  });
                },
                child: Container(
                  width: 100,
                  height: 80,
                  padding: const EdgeInsets.all(7),
                  decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Edit', style: TextStyle(color: CustomColor.greyText, fontSize: 18, fontWeight: FontWeight.w600)),
                      SizedBox(height: 10),
                      Text('Delete', style: TextStyle(color: CustomColor.greyText, fontSize: 18, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              )
          ],
        )
      ],
    );
  }
}
