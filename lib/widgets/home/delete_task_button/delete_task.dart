import 'package:flutter/material.dart';
import 'package:tasklify/controllers/task/task_functions.dart';
import 'package:tasklify/models/task.dart';
import 'package:tasklify/theme/app_colors.dart';

class DeleteTaskButton extends StatelessWidget {
  final List<Task> tasks;
  final Task task;
  final VoidCallback onTaskDeleted;

  const DeleteTaskButton({
    super.key,
    required this.tasks,
    required this.task,
    required this.onTaskDeleted,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete, color: Colors.red),
      onPressed: () {
        showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16), // thoda smooth look
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 20,
              ),
              actionsPadding: const EdgeInsets.only(
                bottom: 20,
                right: 20,
                left: 20,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: Colors.red,
                    size: 50,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Are you sure you want to delete\nthis task ?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 110,
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            202,
                            83,
                            75,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          TaskFunctions.deleteTask(tasks, task);
                          onTaskDeleted();
                          Navigator.of(ctx).pop();
                        },
                        child: const Text(
                          "Yes",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 110,
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.buttonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }
}
