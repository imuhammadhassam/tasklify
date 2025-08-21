import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:tasklify/controllers/task/task_functions.dart';
import 'package:tasklify/models/task.dart';
import 'package:tasklify/views/add_task/add_task_screen.dart';

class TaskEditButton extends StatelessWidget {
  final Task task;
  final List<Task> tasks;

  const TaskEditButton({super.key, required this.task, required this.tasks});

  void showCustomSnackBar(
    BuildContext context,
    String title,
    String message,
    ContentType type,
  ) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: type,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.edit, color: Colors.blue),
      onPressed: () async {
        final updatedTask = await Navigator.push<Task>(
          context,
          MaterialPageRoute(builder: (_) => AddTaskScreen(task: task)),
        );

        if (updatedTask != null) {
          // ✅ Update task
          TaskFunctions.editTask(tasks, task, updatedTask);

          // ✅ Show awesome snackbar
          showCustomSnackBar(
            context,
            "Task Updated",
            '"${updatedTask.title}" updated successfully 🎉',
            ContentType.success,
          );
        } else {
          // ❌ User cancelled edit
          showCustomSnackBar(
            context,
            "Edit Cancelled",
            '"${task.title}" edit cancelled ❌',
            ContentType.warning,
          );
        }
      },
    );
  }
}
