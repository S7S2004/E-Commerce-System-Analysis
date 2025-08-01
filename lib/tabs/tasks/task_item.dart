import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../gen_l10n/app_localizations.dart';
import '../../home_screen.dart';
import 'edit_task_screen.dart';

class TaskItem extends StatefulWidget {
  final Task task;
  final Function(Task) onEdit;
  final VoidCallback onDelete;
  final VoidCallback onToggleStatus;

  const TaskItem({
    Key? key,
    required this.task,
    required this.onEdit,
    required this.onDelete,
    required this.onToggleStatus,
  }) : super(key: key);

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  void _deleteTask() {
    try {
      widget.onDelete();
      Fluttertoast.showToast(
        msg: AppLocalizations.of(context)!.taskdeleted,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: AppLocalizations.of(context)!.somethingError,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  void _editTask() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditTaskScreen(
          task: widget.task,
          onTaskEdited: widget.onEdit,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => _deleteTask(),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: AppLocalizations.of(context)!.delte,
          ),
        ],
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListTile(
          leading: Checkbox(
            value: widget.task.isDone,
            onChanged: (value) => widget.onToggleStatus(),
          ),
          title: Text(
            widget.task.title,
            style: TextStyle(
              decoration: widget.task.isDone
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.task.description),
              const SizedBox(height: 4),
              Text(
                '${widget.task.date.day}/${widget.task.date.month}/${widget.task.date.year}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.task.isDone)
                Chip(
                  label: Text(
                    AppLocalizations.of(context)!.isDone,
                    style: const TextStyle(fontSize: 12),
                  ),
                  backgroundColor: Colors.green,
                ),
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: _editTask,
              ),
            ],
          ),
          isThreeLine: true,
        ),
      ),
    );
  }
}