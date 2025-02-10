import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:task_manager/Ui/Widgets/screen_background.dart';
import 'package:task_manager/Ui/Widgets/task_list_tile.dart';
import 'package:task_manager/Ui/Widgets/userBanner.dart';
import 'package:task_manager/data/models/login_model.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/models/task_list_model.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';

class ProgressTask extends StatefulWidget {
  const ProgressTask({super.key});

  @override
  State<ProgressTask> createState() => _ProgressTaskState();
}

class _ProgressTaskState extends State<ProgressTask> {
  TaskListMdoel _inProgressTaskModel = TaskListMdoel();
  @override
  void initState() {
    super.initState();

    _getInProgressTask();
  }

  Future<void> _getInProgressTask() async {
    NetworkResponse _response =
        await NetworkCaller().getRequest(Urls.getInProgresslink);

    if (_response.isSuccess) {
      if (mounted) {
        setState(() {});
      }

      _inProgressTaskModel = TaskListMdoel.fromJson(_response.body!);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Successful to upload Inprogress"),
        backgroundColor: Colors.green,
        //duration: Duration(milliseconds: 40),
        showCloseIcon: true,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to Upload"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScreenBackground(
          child: Column(
            children: [
              UserBanner(),
              Expanded(
                child: ListView.separated(
                    padding: EdgeInsets.all(10),
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: _inProgressTaskModel.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return TaskListTile(
                          data: _inProgressTaskModel.data![index]);
                    }),
              )
            ],
          ),
        ),
        //     ),
      ),
    );
  }
}
