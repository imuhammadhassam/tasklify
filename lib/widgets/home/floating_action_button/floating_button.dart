import 'package:flutter/material.dart';
import 'package:tasklify/controllers/task/task_functions.dart';
import 'package:tasklify/models/task.dart';
import 'package:tasklify/views/add_task/add_task_screen.dart';
import 'package:tasklify/theme/app_colors.dart';

class CustomFAB extends StatelessWidget {
  final List<Task> tasks;
  final Function(List<Task>) onTaskAdded;

  const CustomFAB({super.key, required this.tasks, required this.onTaskAdded});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: FloatingActionButton(
        onPressed: () async {
          final newTask = await Navigator.push<Task>(
            context,
            MaterialPageRoute(builder: (_) => const AddTaskScreen()),
          );
          if (newTask != null) {
            TaskFunctions.addTask(tasks, newTask);
            onTaskAdded(List.from(tasks)); // state update trigger
          }
        },
        backgroundColor: AppColors.buttonColor,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
