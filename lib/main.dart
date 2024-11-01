import 'package:flutter/material.dart';
import 'package:habit_tracker/core/custom_color.dart';
import 'package:habit_tracker/pages/home_page.dart';
import 'package:habit_tracker/pages/progress_page.dart';
import 'package:habit_tracker/pages/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late PageController _tabController;

  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const ProgressPage(),
    const SettingsPage(),
    // const SettingsPage(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = PageController(initialPage: _selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: CustomColor.bgColor,
        body: SafeArea(
          child: PageView(
            controller: _tabController,
            children: _pages,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
              _tabController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.monitor_heart_outlined), label: 'Progress'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
          ],
        ),
      ),
    );
  }
}
