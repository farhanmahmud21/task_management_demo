import 'package:flutter/material.dart';
import 'package:task_manager/Ui/Screens/splashScreen.dart';

class Task_Manager extends StatefulWidget {
  static GlobalKey globalKey = GlobalKey();

  const Task_Manager({super.key});

  @override
  State<Task_Manager> createState() => _Task_ManagerState();
}

class _Task_ManagerState extends State<Task_Manager> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: Task_Manager.globalKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 40, 189, 45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 40, 189, 45),
          ),
        ),
        // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        //   backgroundColor: Color.fromARGB(
        //       255, 40, 189, 45), // Match your elevated button color
        //   selectedItemColor: Colors.white,
        //   unselectedItemColor: Colors.white70,
        //   elevation: 8,
        //   type: BottomNavigationBarType.fixed,
        // ),
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: SplashScreen(),
    );
  }
}
