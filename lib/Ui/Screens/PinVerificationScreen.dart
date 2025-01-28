import 'package:flutter/material.dart';
import 'package:task_manager/Ui/Screens/set_password_page.dart';
import 'package:task_manager/Ui/Widgets/screen_background.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinVerificationPage extends StatefulWidget {
  const PinVerificationPage({super.key});

  @override
  State<PinVerificationPage> createState() => _PinVerificationPageState();
}

class _PinVerificationPageState extends State<PinVerificationPage> {
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
                'Pin Verification',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Text(
                  'A 6 digit verification code will be sent to this email address'),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.all(10),
                child: PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      activeColor: Colors.green,
                      selectedFillColor: Colors.white,
                      selectedColor: Colors.grey,
                      inactiveColor: Colors.greenAccent,
                      inactiveFillColor: Colors.redAccent),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.blue.shade50,
                  enableActiveFill: true,
                  onChanged: (value) {
                    print(value);
                  },
                  appContext: context,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SetPasswordPage()));
                  },
                  child: Text('Verify'),
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
    );
  }
}
