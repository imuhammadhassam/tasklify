import 'package:flutter/material.dart';
import 'package:tasklify/controllers/task/task_functions.dart';
import 'package:tasklify/models/task.dart';
import 'package:tasklify/views/add_task/add_task_screen.dart';

class TaskEditButton extends StatelessWidget {
  final Task task;
  final List<Task> tasks;

  const TaskEditButton({super.key, required this.task, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.edit, color: Colors.blue),
      onPressed: () async {
        // ✏️ Edit Screen
        final updatedTask = await Navigator.push<Task>(
          context,
          MaterialPageRoute(builder: (_) => AddTaskScreen(task: task)),
        );
        if (updatedTask != null) {
          TaskFunctions.editTask(tasks, task, updatedTask);
        }
      },
    );
  }
}
