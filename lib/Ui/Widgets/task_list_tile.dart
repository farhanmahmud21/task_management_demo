import 'package:flutter/material.dart';
import 'package:task_manager/data/models/task_list_model.dart';

class TaskListTile extends StatelessWidget {
  final TaskData data;
  const TaskListTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.yellow.shade100,
      title: Text(data.title ?? "Unknown"),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data.description ?? "No Description"),
          Text(data.createdDate ?? "0"),
          Row(
            children: [
              Chip(
                label: Text(data.status ?? "Null"),
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
    );
  }
}
