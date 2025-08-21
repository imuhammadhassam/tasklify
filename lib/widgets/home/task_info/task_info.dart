import 'package:flutter/material.dart';
import 'package:tasklify/models/task.dart';

class TaskInfoWidget extends StatelessWidget {
  final Task task;

  const TaskInfoWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            task.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            task.description,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
          Text(
            "${task.createdAt.hour}:${task.createdAt.minute.toString().padLeft(2, '0')}",
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
