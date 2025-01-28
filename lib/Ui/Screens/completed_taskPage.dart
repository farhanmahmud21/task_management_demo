import 'package:flutter/material.dart';
import 'package:task_manager/Ui/Widgets/screen_background.dart';
import 'package:task_manager/Ui/Widgets/userBanner.dart';

class CompletedTaskpage extends StatelessWidget {
  const CompletedTaskpage({super.key});

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
                                    backgroundColor: Colors.green,
                                    label: Text(
                                      'Completed',
                                      style: TextStyle(color: Colors.white),
                                    ),
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
