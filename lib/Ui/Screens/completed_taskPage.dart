import 'package:flutter/material.dart';
import 'package:task_manager/Ui/Widgets/screen_background.dart';
import 'package:task_manager/Ui/Widgets/task_list_tile.dart';
import 'package:task_manager/Ui/Widgets/userBanner.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/models/task_list_model.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';

class CompletedTaskpage extends StatefulWidget {
  const CompletedTaskpage({super.key});

  @override
  State<CompletedTaskpage> createState() => _CompletedTaskpageState();
}

class _CompletedTaskpageState extends State<CompletedTaskpage> {
  TaskListMdoel _completedTaskModel = TaskListMdoel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getCompletedtask();
    });
  }

  Future<void> getCompletedtask() async {
    setState(() {});
    NetworkResponse response =
        await NetworkCaller().getRequest(Urls.getCompleteTask);

    if (mounted) {
      setState(() {
        if (response.isSuccess) {
          _completedTaskModel = TaskListMdoel.fromJson(response.body!);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to upload'),
            ),
          );
        }
      });
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
                child: RefreshIndicator(
                  onRefresh: () async {
                    setState(() {
                      getCompletedtask();
                      _completedTaskModel = _completedTaskModel;
                    });
                  },
                  child: ListView.separated(
                      padding: EdgeInsets.all(10),
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: _completedTaskModel.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Container(
                          color: const Color.fromARGB(148, 255, 255, 255),
                          child: TaskListTile(
                              data: _completedTaskModel.data![index]),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
