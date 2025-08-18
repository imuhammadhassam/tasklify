import 'package:tasklify/models/task.dart';

List<Task> mockTasks = [
  Task(
    id: 1,
    title: 'Complete Flutter project',
    description: 'Finish the Flutter project for the client by next week.',
    createdAt: DateTime.now().add(Duration(days: 7)),
    isCompleted: false,
  ),
  Task(
    id: 2,
    title: 'Grocery shopping',
    description:
        'Buy groceries for the week including fruits, vegetables, and snacks.',
    createdAt: DateTime.now().add(Duration(days: 2)),
    isCompleted: false,
  ),
  Task(
    id: 3,
    title: 'Read a book',
    description: 'Finish reading "The Great Gatsby" by F. Scott Fitzgerald.',
    createdAt: DateTime.now().add(Duration(days: 14)),
    isCompleted: true,
  ),

  Task(
    id: 4,
    title: 'Workout',
    description: 'Complete a 30-minute workout session at the gym.',
    createdAt: DateTime.now().add(Duration(days: 1)),
    isCompleted: false,
  ),

  Task(
    id: 5,
    title: 'Plan vacation',
    description: 'Research and plan the itinerary for the upcoming vacation.',
    createdAt: DateTime.now().add(Duration(days: 30)),
    isCompleted: false,
  ),
];
