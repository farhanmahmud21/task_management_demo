import 'package:flutter/material.dart';
import 'package:task_manager/Ui/Screens/add_new_task.dart';
import 'package:task_manager/Ui/Widgets/screen_background.dart';
import 'package:task_manager/Ui/Widgets/summaryDataCard.dart';
import 'package:task_manager/Ui/Widgets/summary_card.dart';
import 'package:task_manager/Ui/Widgets/task_list_tile.dart';
import 'package:task_manager/Ui/Widgets/userBanner.dart';
import 'package:task_manager/data/models/network_response.dart';
import 'package:task_manager/data/models/summary_card_model.dart';
import 'package:task_manager/data/models/task_list_model.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  bool _isLoading = false;
  TaskListMdoel _taskListModel = TaskListMdoel();
  SummaryCardMdoel _summary_cardModel = SummaryCardMdoel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getNewTask();
      _getSummaryData();
    });
  }

  Future<void> _getSummaryData() async {
    setState(() => _isLoading = true);
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.summary_card);
    if (response.isSuccess) {
      _summary_cardModel = SummaryCardMdoel.fromJson(response.body!);
      setState(() => _isLoading = false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to show'),
        ),
      );
    }
  }

  Future<void> getNewTask() async {
    if (mounted) {
      setState(() {});
      final NetworkResponse response =
          await NetworkCaller().getRequest(Urls.getNewTask);
      if (response.isSuccess) {
        _taskListModel = TaskListMdoel.fromJson(response.body!);
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: Text("Success")));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Failed")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddNewTask(),
              ));
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: ScreenBackground(
          child: Column(
            children: [
              UserBanner(),
              SummaryDataCard(
                data: _summary_cardModel.data ?? [],
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    setState(() {});
                    getNewTask();
                    _taskListModel = _taskListModel;
                  },
                  child: ListView.separated(
                      padding: EdgeInsets.all(10),
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: _taskListModel.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Container(
                            color: const Color.fromARGB(148, 255, 255, 255),
                            child: TaskListTile(
                              data: _taskListModel.data![index],
                            ));
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
