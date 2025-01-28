import 'package:flutter/material.dart';
import 'package:task_manager/Ui/Widgets/screen_background.dart';
import 'PinVerificationScreen.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ScreenBackground(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Email Address',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Text(
              'A 6 digit verification code will be sent to this email address'),
          TextField(
            decoration: InputDecoration(
              hintText: 'Email',
            ),
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PinVerificationPage()));
              },
              child: Icon(Icons.arrow_right_alt),
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Have account?'),
              TextButton(onPressed: () {}, child: Text('Sign In'))
            ],
          ),
        ],
      )),
    ));
  }
}
