import 'package:flutter/material.dart';
import 'package:task_manager/Ui/Screens/cancelled_taskPage.dart';
import 'package:task_manager/Ui/Screens/completed_taskPage.dart';
import 'package:task_manager/Ui/Screens/new_task_screen.dart';
import 'package:task_manager/Ui/Screens/progress_task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 40, 189, 45),
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex,
          unselectedItemColor: Colors.white70,
          selectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(

                //activeIcon: Icon(Icons.new_releases),
                // backgroundColor: Colors.green, // Green color
                icon: Icon(Icons.upgrade_rounded),
                label: 'New'),
            BottomNavigationBarItem(
                // Green color
                icon: Icon(Icons.done_all),
                label: 'Completed'),
            BottomNavigationBarItem(
                // Green color
                icon: Icon(Icons.cancel_outlined),
                label: 'Cancelled'),
            BottomNavigationBarItem(
                // Green color
                icon: Icon(Icons.list),
                label: 'Progress'),
          ]),
      body: _currentIndex == 0
          ? NewTaskScreen()
          : _currentIndex == 1
              ? CompletedTaskpage()
              : _currentIndex == 2
                  ? CancelledTaskpage()
                  : _currentIndex == 3
                      ? ProgressTask()
                      : Container(),
    );
  }
}
