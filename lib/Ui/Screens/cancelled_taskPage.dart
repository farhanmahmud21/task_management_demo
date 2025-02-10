import 'package:flutter/material.dart';

import 'package:task_manager/Ui/Widgets/screen_background.dart';
import 'package:task_manager/Ui/Widgets/task_list_tile.dart';
import 'package:task_manager/Ui/Widgets/userBanner.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/models/task_list_model.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';

class CancelledTaskpage extends StatefulWidget {
  const CancelledTaskpage({super.key});

  @override
  State<CancelledTaskpage> createState() => _CancelledTaskpageState();
}

class _CancelledTaskpageState extends State<CancelledTaskpage> {
  @override
  void initState() {
    super.initState();
    _getCancelledTask();
    // WidgetsBinding.instance.addPostFrameCallback((_) {

    // });
  }

  TaskListMdoel _cancelledTaskModel = TaskListMdoel();

  Future<void> _getCancelledTask() async {
    NetworkResponse _response =
        await NetworkCaller().getRequest(Urls.getCancelledTask);

    if (_response.isSuccess) {
      if (mounted) {
        setState(() {});
      }
      _cancelledTaskModel = TaskListMdoel.fromJson(_response.body!);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Successfully Uploded'),
        backgroundColor: Colors.green,
        // duration: Duration(milliseconds: 40),
        showCloseIcon: true,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to Upload'),
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
                child: RefreshIndicator(
                  onRefresh: () async {
                    setState(() {
                      _getCancelledTask();
                    });
                  },
                  child: ListView.separated(
                      padding: EdgeInsets.all(10),
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: _cancelledTaskModel.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return TaskListTile(
                            data: _cancelledTaskModel.data![index]);
                      }),
                ),
              )
            ],
          ),
        ),
        //     ),
      ),
    );
  }
}
