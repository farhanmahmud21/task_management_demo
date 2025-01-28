import 'package:flutter/material.dart';
import 'package:task_manager/Ui/Screens/home_page.dart';
import 'package:task_manager/Ui/Widgets/screen_background.dart';
import 'package:task_manager/Ui/Screens/EmailScreen.dart';
import 'package:task_manager/data/models/auth_utility.dart';
import 'package:task_manager/data/models/login_model.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  final TextEditingController _emailLTECOntroller = TextEditingController();
  final TextEditingController _passwordLTECOntroller = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Future<void> userLogin() async {
    NetworkResponse response =
        await NetworkCaller().postRequest(Urls.login, <String, dynamic>{
      "email": _emailLTECOntroller.text.trim(),
      "password": _passwordLTECOntroller.text
    });
    if (response.isSuccess) {
      LoginModel model = LoginModel.fromJson(response.body!);
      await AuthUtility.saveUserInfo(model);
      if (mounted) {
        _emailLTECOntroller.clear();
        _passwordLTECOntroller.clear();
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('User Logged In Successfully')));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('User Login Failed')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScreenBackground(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Getting Started With',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: _emailLTECOntroller,
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Email is required';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  obscureText: _obscureText,
                  controller: _passwordLTECOntroller,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        icon: Icon(Icons.visibility)),
                    hintText: 'Password',
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Password is required';
                    } else {
                      return null;
                    }
                  },
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (!_formkey.currentState!.validate()) {
                        return;
                      }
                      userLogin();
                    },
                    child: Icon(Icons.arrow_right_alt),
                  ),
                ),
                SizedBox(height: 30),
                Center(
                    child: TextButton(
                        onPressed: () {}, child: Text('Forgot Password?'))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?'),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EmailScreen()));
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 30, 206, 45)),
                        ))
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
