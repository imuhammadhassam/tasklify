import 'package:flutter/material.dart';
import 'package:tasklify/controllers/task/task_functions.dart';
import 'package:tasklify/mocks/mock_tasks.dart';
import 'package:tasklify/models/task.dart';
import 'package:tasklify/theme/app_colors.dart';
import 'package:tasklify/theme/app_units.dart';
import 'package:tasklify/views/completed_tasks/completed_tasks.dart';
import 'package:tasklify/views/pending_tasks/pending_tasks.dart';
import 'package:tasklify/widgets/drawer/profile_header.dart';
import 'package:tasklify/widgets/drawer/task_cards.dart';
import 'package:tasklify/widgets/home/delete_task_button/delete_task.dart';
import 'package:tasklify/widgets/home/drawer_icon/drawer_icon_button.dart';
import 'package:tasklify/widgets/home/edit_task_button/task_edit.dart';
import 'package:tasklify/widgets/home/floating_action_button/floating_button.dart';
import 'package:tasklify/widgets/home/home_header/home_header.dart';
import 'package:tasklify/widgets/home/home_paddings/home_padding1.dart';
import 'package:tasklify/widgets/home/home_paddings/home_padding2.dart';
import 'package:tasklify/widgets/home/status_button/status_button.dart';
import 'package:tasklify/widgets/home/task_info/task_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = mockTasks;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        body: Column(
          children: [
            // Top Header
            Container(
              padding: AppPadding1.screenPadding,
              decoration: BoxDecoration(color: AppColors.buttonColor),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DrawerIconButton(),
                  AppUnits.x12,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [HomeHeader()],
                  ),
                  const Spacer(),
                  const CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage("assets/profile.jpg"),
                  ),
                ],
              ),
            ),

            // White container for tasks
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.scaffoldBackgroundColor1,
                ),
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];
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
                            color: Colors.grey,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment:
                            CrossAxisAlignment.center, // ✅ vertical center
                        children: [
                          Icon(
                            Icons.work_outline,
                            color: AppColors.buttonColor,
                            size: 30, // optional, adjust size
                          ),
                          AppUnits.x12,
                          Expanded(child: TaskInfoWidget(task: task)),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment
                                .center, // ✅ align vertically center
                            children: [
                              // 🔹 Row: Mark as Completed + Delete
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  StatusButton(
                                    text: task.isCompleted
                                        ? "Completed"
                                        : "Mark as Completed",
                                    backgroundColor: task.isCompleted
                                        ? const Color.fromARGB(255, 202, 83, 75)
                                        : AppColors.buttonColor,
                                    textColor: Colors.white,
                                    onPressed: task.isCompleted
                                        ? null
                                        : () {
                                            setState(() {
                                              TaskFunctions.toggleComplete(
                                                task,
                                              );
                                            });
                                          },
                                  ),
                                  AppUnits.x8,
                                  DeleteTaskButton(
                                    tasks: tasks,
                                    task: task,
                                    onTaskDeleted: () => setState(() {}),
                                  ),
                                ],
                              ),

                              AppUnits.y8,

                              // 🔹 Row: Mark as Pending + Edit
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  StatusButton(
                                    text: !task.isCompleted
                                        ? "Pending"
                                        : "Mark as Pending",
                                    backgroundColor: !task.isCompleted
                                        ? Colors.grey
                                        : Colors.orange,
                                    textColor: Colors.white,
                                    onPressed: !task.isCompleted
                                        ? null
                                        : () {
                                            setState(() {
                                              TaskFunctions.toggleComplete(
                                                task,
                                              );
                                            });
                                          },
                                  ),
                                  AppUnits.x8,
                                  TaskEditButton(task: task, tasks: tasks),
                                ],
                              ),
                            ],
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
        //  -------------------------------------------------------------------------             FAB
        floatingActionButton: CustomFAB(
          tasks: tasks,
          onTaskAdded: (updatedTasks) {
            setState(() {
              tasks = updatedTasks;
            });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        //  -------------------------------------------------------------------------            DRAWER
        drawer: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(40), // ✅ Rounded border
          ),
          child: Drawer(
            backgroundColor: AppColors.scaffoldBackgroundColor,
            child: Column(
              children: [
                // --------------------------------------------------------------------      DRAWER TOP PROFILE CARD
                Container(
                  padding: AppPadding2.screenPadding,
                  color: AppColors.buttonColor,
                  child: Row(children: [ProfileHeader()]),
                ),
                AppUnits.y20,
                // -------------------------------------------------------------------- DRAWER SECOND CONTAINER WITH 2 BUTTONS
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      TaskCard(
                        icon: Icons.pending_actions,
                        title: "Pending Tasks",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PendingTasksScreen(tasks: tasks),
                            ),
                          );
                        },
                      ),
                      AppUnits.y12,
                      TaskCard(
                        icon: Icons.check_circle,
                        title: "Completed Tasks",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CompletedTasksScreen(tasks: tasks),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
