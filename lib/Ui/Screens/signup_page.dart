import 'package:flutter/material.dart';        
import 'package:task_manager/Ui/Widgets/screen_background.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool inProgress = false;
  bool _obscureText = true;
  final TextEditingController _emailTECOntroller = TextEditingController();
  final TextEditingController _firstNameTECOntroller = TextEditingController();
  final TextEditingController _lastNameTECOntroller = TextEditingController();
  final TextEditingController _phoneNumberTECOntroller =
      TextEditingController();
  final TextEditingController _passwordTECOntroller = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Future<void> userSignUp() async {
    setState(() {
      inProgress = true;
    });
    final NetworkResponse response =
        await NetworkCaller().postRequest(Urls.registration, <String, dynamic>{
      "email": _emailTECOntroller.text.trim(),
      "firstName": _firstNameTECOntroller.text.trim(),
      "lastName": _lastNameTECOntroller.text.trim(),
      "mobile": _phoneNumberTECOntroller.text,
      "password": _passwordTECOntroller.text
    });
    if (response.isSuccess) {
      if (mounted) {
        _emailTECOntroller.clear();
        _firstNameTECOntroller.clear();
        _lastNameTECOntroller.clear();
        _phoneNumberTECOntroller.clear();
        _passwordTECOntroller.clear();
        setState(() {
          inProgress = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('User Registered Successfully')));
      }
    } else {
      if (mounted) {
        setState(() {
          inProgress = false;
        });
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('User Registration Failed')));
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
            child: Center(
              heightFactor: 1.2,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Join With Us',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: _emailTECOntroller,
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
                      controller: _firstNameTECOntroller,
                      decoration: InputDecoration(
                        hintText: 'First Name',
                      ),
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return 'First Name is required';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _lastNameTECOntroller,
                      decoration: InputDecoration(
                        hintText: 'Last Name',
                      ),
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return 'Last Name is required';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _phoneNumberTECOntroller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Phone Number',
                      ),
                      validator: (String? value) {
                        if ((value?.isEmpty ?? true) || (value!.length < 11)) {
                          return 'Phone Number is required and must be 11 digits';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordTECOntroller,
                      obscureText: _obscureText,
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
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      child: Visibility(
                        replacement: Center(child: CircularProgressIndicator()),
                        visible: inProgress == false,
                        child: ElevatedButton(
                          onPressed: () {
                            if (!_formkey.currentState!.validate()) {
                              return;
                            }
                            userSignUp();
                          },
                          child: Icon(Icons.arrow_right_alt),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account?'),
                        TextButton(onPressed: () {}, child: Text('Sign In'))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
