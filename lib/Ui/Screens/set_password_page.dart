import 'package:flutter/material.dart';
import 'package:task_manager/Ui/Screens/signup_page.dart';
import 'package:task_manager/Ui/Widgets/screen_background.dart';

class SetPasswordPage extends StatelessWidget {
  const SetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScreenBackground(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Set Password',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Minimum 8 characters with a mix of letters, numbers & symbols',
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                SizedBox(height: 15),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    },
                    child: Icon(Icons.arrow_right_alt),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Have account?'),
                    TextButton(onPressed: () {}, child: Text('Sign In'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
