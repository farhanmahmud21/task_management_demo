import 'dart:math';

import 'package:flutter/material.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/models/task_list_model.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';

class Update_task extends StatefulWidget {
  final TaskData task;

  Update_task({super.key, required this.task});

  @override
  State<Update_task> createState() => _Update_taskState();
}

class _Update_taskState extends State<Update_task> {
  late TextEditingController _subjTEController;

  late TextEditingController _descrTEController;

  @override
  void initState() {
    super.initState();
    _subjTEController = TextEditingController(text: widget.task.title);
    _descrTEController = TextEditingController(text: widget.task.description);
  }

  Future<void> updatetasks() async {
    NetworkResponse _response =
        await NetworkCaller().postRequest(Urls.addTask, <String, dynamic>{
      'title': _subjTEController.text.trim(),
      'description': _descrTEController.text.trim(),
      'status': 'New'
    });
    if (_response.isSuccess) {
      _subjTEController.clear();
      _descrTEController.clear();
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Updated Successfully'),
        ),
        
      );
    }
   
     else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Update Unsuccesffuly'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          children: [
            Align(
              heightFactor: 1.5,
              alignment: Alignment.centerLeft,
              child: Text(
                'Update Task',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            TextField(
              controller: _subjTEController,
              decoration: InputDecoration(
                hintText: 'Subject',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _descrTEController,
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
                  updatetasks();
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_right_alt_rounded),
              ),
            )
          ],
        ),
      ),
    );
  }
}
