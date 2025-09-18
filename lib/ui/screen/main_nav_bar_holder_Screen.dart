import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/Canceled_Task_Screen.dart';
import 'package:task_manager/ui/screen/Progress_Task_Screen.dart';
import '../widgets/TM_App_Bar.dart';
import 'Completed_Task_Screen.dart';
import 'New_Task_Screen.dart';

class MainNavBarHolderScreen extends StatefulWidget {
  const MainNavBarHolderScreen({super.key});

  @override
  State<MainNavBarHolderScreen> createState() => _MainNavBarHolderScreenState();
}

class _MainNavBarHolderScreenState extends State<MainNavBarHolderScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    NewTaskScreen(),
    ProgressTaskScreen(),
    CanceledTaskScreen(),
    CompletedTaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      TMAppBar(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.new_label), label: "New"),
          NavigationDestination(
            icon: Icon(Icons.run_circle_outlined),
            label: "Progress",
          ),
          NavigationDestination(icon: Icon(Icons.cancel), label: "Canceled"),
          NavigationDestination(
            icon: Icon(Icons.check_box),
            label: "Completed",
          ),
        ],
      ),
    );
  }
}


