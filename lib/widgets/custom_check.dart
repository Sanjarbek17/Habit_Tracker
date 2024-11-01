import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/gen/assets.gen.dart';

class CustomCheckBox extends StatelessWidget {
  final bool isChecked;
  final void Function() onTap;
  const CustomCheckBox({
    super.key,
    required this.isChecked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isChecked ? 34 : 30,
      width: isChecked ? 34 : 30,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        border: Border.all(width: 2, color: isChecked ? Colors.white : Colors.black),
      ),
      child: InkWell(
        onTap: onTap,
        child: isChecked
            ? SvgPicture.asset(
                Assets.icons.check,
                fit: BoxFit.cover,
              )
            : const SizedBox(),
      ),
    );
  }
}
