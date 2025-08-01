import 'package:flutter/material.dart';
import 'gen_l10n/app_localizations.dart';
import 'tabs/tasks/add_task_bottom_sheet.dart';
import 'tabs/tasks/task_item.dart';
import 'tabs/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<Task> _tasks = [];

  void _addTask(Task task) {
    setState(() {
      _tasks.add(task);
    });
  }

  void _editTask(int index, Task task) {
    setState(() {
      _tasks[index] = task;
    });
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  void _toggleTaskStatus(int index) {
    setState(() {
      _tasks[index] = _tasks[index].copyWith(isDone: !_tasks[index].isDone);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.todoList,
        ),
      ),
      body: _currentIndex == 0
          ? _buildTasksList()
          : const SettingsTab(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      floatingActionButton: _currentIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => AddTaskBottomSheet(
                    onTaskAdded: _addTask,
                  ),
                );
              },
              child: const Icon(Icons.add),
            )
          : null,
    );
  }

  Widget _buildTasksList() {
    if (_tasks.isEmpty) {
      return const Center(
        child: Text('No tasks yet'),
      );
    }

    return ListView.builder(
      itemCount: _tasks.length,
      itemBuilder: (context, index) {
        return TaskItem(
          task: _tasks[index],
          onEdit: (task) => _editTask(index, task),
          onDelete: () => _deleteTask(index),
          onToggleStatus: () => _toggleTaskStatus(index),
        );
      },
    );
  }
}

class Task {
  final String title;
  final String description;
  final DateTime date;
  final bool isDone;

  Task({
    required this.title,
    required this.description,
    required this.date,
    this.isDone = false,
  });

  Task copyWith({
    String? title,
    String? description,
    DateTime? date,
    bool? isDone,
  }) {
    return Task(
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      isDone: isDone ?? this.isDone,
    );
  }
}