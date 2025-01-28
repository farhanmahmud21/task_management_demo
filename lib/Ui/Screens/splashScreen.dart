import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/Ui/Screens/LoginScreen.dart';
import 'package:task_manager/Ui/Screens/home_page.dart';
import 'package:task_manager/Ui/Widgets/screen_background.dart';
import 'package:task_manager/data/models/auth_utility.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToLogin();
  }

  void navigateToLogin() {
    Future.delayed(Duration(seconds: 5)).then((_) async {
      final bool isLoggedin = await AuthUtility.checkifUserLoggedIn();
      if (mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => isLoggedin ? HomePage() : LoginScreen()),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Center(
            child: SvgPicture.asset(
          'assets/images/logo.svg',
          fit: BoxFit.fill,
        )),
      ),
    );
  }
}
