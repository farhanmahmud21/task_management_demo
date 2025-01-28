import 'package:flutter/material.dart';
import 'package:task_manager/Ui/Widgets/screen_background.dart';
import 'package:task_manager/Ui/Widgets/userBanner.dart';

class AddNewTask extends StatelessWidget {
  const AddNewTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScreenBackground(
            child: SingleChildScrollView(
          child: Column(
            children: [
              UserBanner(),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Align(
                      heightFactor: 1.5,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Add New Task',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Subject',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      maxLines: 10,
                      decoration: InputDecoration(
                        hintText: 'Description',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_right_alt_rounded),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
