import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/gen/assets.gen.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
    super.key,
  });

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10)), border: Border.all(width: 2, color: isChecked ? Colors.white : Colors.black)),
      child: InkWell(
        child: isChecked
            ? SvgPicture.asset(
                Assets.icons.check,
                fit: BoxFit.cover,
              )
            : const SizedBox(),
        onTap: () {
          setState(() {
            isChecked = !isChecked;
          });
        },
      ),
    );
  }
}
