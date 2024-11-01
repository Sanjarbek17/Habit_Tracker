import 'package:flutter/material.dart';
import 'package:habit_tracker/widgets/settings_card.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(21.0),
          child: Text('Settings', style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ]),
            child: const Column(
              children: [
                SettingsCard(title: 'Account'),
                SettingsCard(title: 'Term and Condition'),
                SettingsCard(title: 'Policy'),
                SettingsCard(title: 'About App'),
              ],
            ),
          ),
        )
      ],
    );
  }
}

