import 'package:flutter/material.dart';
import 'package:task_manager/Ui/Screens/add_new_task.dart';
import 'package:task_manager/Ui/Widgets/screen_background.dart';
import 'package:task_manager/Ui/Widgets/summary_card.dart';
import 'package:task_manager/Ui/Widgets/userBanner.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({super.key});

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SummaryCard(
                      number: 09,
                      title: 'Cancalled',
                    ),
                  ),
                  Expanded(
                    child: SummaryCard(
                      number: 69,
                      title: 'Completed',
                    ),
                  ),
                  Expanded(
                    child: SummaryCard(
                      number: 101,
                      title: 'Progress',
                    ),
                  ),
                  Expanded(
                    child: SummaryCard(
                      number: 029,
                      title: 'New Task',
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.separated(
                    padding: EdgeInsets.all(10),
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        color: const Color.fromARGB(148, 255, 255, 255),
                        child: ListTile(
                          tileColor: Colors.yellow.shade100,
                          title: Text('Task $index'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Description of Task $index'),
                              Text('Date'),
                              Row(
                                children: [
                                  Chip(
                                    label: Text('New'),
                                  ),
                                  Spacer(),
                                  IconButton(
                                      color: Colors.green,
                                      onPressed: () {},
                                      icon: Icon(Icons.document_scanner)),
                                  IconButton(
                                      color: Colors.red,
                                      onPressed: () => {},
                                      icon: Icon(Icons.delete)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
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

