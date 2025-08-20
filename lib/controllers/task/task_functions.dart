import 'package:tasklify/models/task.dart';

class TaskFunctions {
  static void addTask(List<Task> tasks, Task task) {
    tasks.add(task);
  }

  static void deleteTask(List<Task> tasks, Task task) {
    tasks.remove(task);
  }

  static void toggleComplete(Task task) {
    task.isCompleted = !task.isCompleted;
  }

  static void editTask(List<Task> tasks, Task oldTask, Task updatedTask) {
    final index = tasks.indexOf(oldTask);
    if (index != -1) {
      tasks[index] = updatedTask;
    }
  }
}
