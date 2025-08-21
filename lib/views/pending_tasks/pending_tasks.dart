import 'package:flutter/material.dart';
import 'package:tasklify/models/task.dart';
import 'package:tasklify/theme/app_colors.dart';

class PendingTasksScreen extends StatelessWidget {
  final List<Task> tasks;
  const PendingTasksScreen({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    final pendingTasks = tasks.where((t) => !t.isCompleted).toList();

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
        color: Colors.grey.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔙 Back button + Heading row
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Center(
                    child: Text(
                      "Pending Tasks",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 48), // balance back button ka space
              ],
            ),

            const SizedBox(height: 40),

            // 📋 Pending Tasks List
            Expanded(
              child: pendingTasks.isEmpty
                  ? const Center(
                      child: Text(
                        "No Pending Tasks",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: pendingTasks.length,
                      itemBuilder: (context, index) {
                        final task = pendingTasks[index];
                        return Card(
                          color: AppColors.whiteColor,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // ⏳ Icon centre aligned
                                const Padding(
                                  padding: EdgeInsets.only(top: 8),
                                  child: Icon(
                                    Icons.schedule,
                                    color: Colors.orange,
                                    size: 32,
                                  ),
                                ),
                                const SizedBox(width: 12),

                                // 🔹 Task details (Title/Time + Desc/Date)
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Title + Time
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            task.title,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "${task.createdAt.hour}:${task.createdAt.minute.toString().padLeft(2, '0')}",
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 6),
                                      // Description + Date
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              task.description,
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: AppColors.buttonColor,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "${task.createdAt.day}/${task.createdAt.month}/${task.createdAt.year}",
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
