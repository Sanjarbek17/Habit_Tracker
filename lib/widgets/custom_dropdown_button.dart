import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/core/custom_color.dart';

class CustomDropdownButton extends StatelessWidget {
  final String dropdownValue;
  final Function(String?)? onChanged;
  final List<List<String>> items;
  const CustomDropdownButton({
    super.key,
    required this.dropdownValue,
    this.onChanged,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        value: dropdownValue,
        onChanged: onChanged,
        items: items.map((List<String> value) {
          return DropdownMenuItem<String>(
            value: value.first,
            child: Text(value.last, style: const TextStyle(fontSize: 14, color: CustomColor.text, fontWeight: FontWeight.w600)),
          );
        }).toList(),
        buttonStyleData: ButtonStyleData(decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: CustomColor.greyBg)),
        dropdownStyleData: const DropdownStyleData(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: CustomColor.greyBg), elevation: 5, padding: EdgeInsets.all(10), offset: Offset(0, -10)),
      ),
    );
  }
}
