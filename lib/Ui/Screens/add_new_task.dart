import 'package:flutter/material.dart';
import 'package:task_manager/Ui/Widgets/screen_background.dart';
import 'package:task_manager/Ui/Widgets/userBanner.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key});

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  TextEditingController _sbjTEController = TextEditingController();
  TextEditingController _descTEController = TextEditingController();
  bool inProgress = false;

  Future<void> addTask() async {
    setState(() {
      inProgress = true;
    });
    final NetworkResponse response =
        await NetworkCaller().postRequest(Urls.addTask, <String, dynamic>{
      "title": _sbjTEController.text.trim(),
      "description": _descTEController.text.trim(),
      "status": "New"
    });

    if (response.isSuccess) {
      setState(() {});
      inProgress = false;
      _sbjTEController.clear();
      _descTEController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Task Added Successfully"),
        ),
      );
    } else {
      inProgress = false;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Task Adding Failed"),
        ),
      );
    }
  }

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
                      controller: _sbjTEController,
                      decoration: InputDecoration(
                        hintText: 'Subject',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _descTEController,
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
                      child: Visibility(
                        visible: inProgress == false,
                        replacement: Center(child: LinearProgressIndicator()),
                        child: ElevatedButton(
                          onPressed: () {
                            addTask();
                          },
                          child: Icon(Icons.arrow_right_alt_rounded),
                        ),
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
