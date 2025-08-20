import 'package:flutter/material.dart';
import 'package:tasklify/mocks/mock_tasks.dart';
import 'package:tasklify/models/task.dart';
import 'package:tasklify/theme/app_colors.dart';
import 'package:tasklify/views/add_task/add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = mockTasks;
  bool showCompleted = false;

  void addTask(Task task) {
    setState(() {
      tasks.add(task);
    });
  }

  void deleteTask(Task task) {
    setState(() {
      tasks.remove(task);
    });
  }

  void toggleComplete(Task task) {
    setState(() {
      task.isCompleted = !task.isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Task> filteredTasks = tasks
        .where((t) => t.isCompleted == showCompleted)
        .toList();

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        body: Column(
          children: [
            // Top Header
            Container(
              padding: const EdgeInsets.only(
                top: 50,
                left: 20,
                right: 20,
                bottom: 20,
              ),
              decoration: BoxDecoration(color: AppColors.buttonColor),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Icon(Icons.grid_view, color: Colors.white, size: 30),
                  IconButton(
                    icon: const Icon(
                      Icons.grid_view,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      Scaffold.of(
                        context,
                      ).openEndDrawer(); // ✅ Drawer open karega
                    },
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello!",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        "Ahmed Ehab",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Saturday, May 25th",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                  const Spacer(),
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage(
                      "assets/profile.jpg",
                    ), // add an image
                  ),
                ],
              ),
            ),

            // White container for tasks
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.scaffoldBackgroundColor1,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: filteredTasks.length,
                  itemBuilder: (context, index) {
                    final task = filteredTasks[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.work_outline,
                            color: AppColors.buttonColor,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  task.title,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "${task.createdAt.hour}:${task.createdAt.minute.toString().padLeft(2, '0')}",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => toggleComplete(task),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.buttonColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                task.isCompleted ? "Done" : "Pending",
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () => deleteTask(task),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),

        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: FloatingActionButton(
            onPressed: () async {
              final newTask = await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AddTaskScreen()),
              );
              if (newTask != null) {
                addTask(newTask);
              }
            },
            backgroundColor: AppColors.buttonColor,
            foregroundColor: Colors.white,
            child: const Icon(Icons.add),
          ),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        endDrawer: Drawer(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                color: AppColors.buttonColor,
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/profile.jpg"),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      "Ahmed Ehab",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
