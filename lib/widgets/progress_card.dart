import 'package:flutter/material.dart';
import 'package:habit_tracker/core/custom_color.dart';

class ProgressCard extends StatelessWidget {
  final String title;
  final String subtitle;
  const ProgressCard({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: CustomColor.cardbg),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('100%', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: CustomColor.green)),
            Column(
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: CustomColor.text)),
                Text(subtitle, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: CustomColor.text)),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: CustomColor.greenbg),
              child: const Text('Achieved', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: CustomColor.green)),
            ),
          ],
        ),
      ),
    );
  }
}
