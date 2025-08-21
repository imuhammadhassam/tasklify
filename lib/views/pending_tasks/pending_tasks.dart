import 'package:flutter/material.dart';
import 'package:tasklify/models/task.dart';
import 'package:tasklify/theme/app_colors.dart';

class PendingTasksScreen extends StatefulWidget {
  final List<Task> tasks;
  const PendingTasksScreen({super.key, required this.tasks});

  @override
  State<PendingTasksScreen> createState() => _PendingTasksScreenState();
}

class _PendingTasksScreenState extends State<PendingTasksScreen> {
  late List<Task> pendingTasks;

  @override
  void initState() {
    super.initState();
    // pending tasks filter
    pendingTasks = widget.tasks.where((t) => !t.isCompleted).toList();
  }

  void markAsCompleted(Task task) {
    setState(() {
      task.isCompleted = true; // ✅ update
      pendingTasks.remove(task); // ✅ remove from pending
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '"${task.title}" marked as completed ✅',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.buttonColor,
        behavior: SnackBarBehavior.floating, // floating style
        margin: const EdgeInsets.all(12), // gap from edges
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // rounded corners
        ),
        duration: const Duration(seconds: 2), // auto hide time
        elevation: 6, // shadow effect
      ),
    );

    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(content: Text('"${task.title}" marked as completed ✅')),
    // );
  }

  @override
  Widget build(BuildContext context) {
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // ⏳ Column 1: Icon
                                const Icon(
                                  Icons.schedule,
                                  color: Colors.orange,
                                  size: 32,
                                ),
                                const SizedBox(width: 12),

                                // 🔹 Column 2: Task details
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        task.title,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        task.description,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.buttonColor,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Row(
                                        children: [
                                          Text(
                                            "${task.createdAt.day}/${task.createdAt.month}/${task.createdAt.year}",
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            "${task.createdAt.hour}:${task.createdAt.minute.toString().padLeft(2, '0')}",
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

                                const SizedBox(width: 12),

                                // ✅ Column 3: Mark as Completed Button
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.buttonColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () => markAsCompleted(task),
                                  child: const Text(
                                    "Done",
                                    style: TextStyle(color: Colors.white),
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
