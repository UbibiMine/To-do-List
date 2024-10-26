import 'package:flutter/material.dart';

class doList extends StatefulWidget {
  @override
  _doListState createState() => _doListState();
}

class _doListState extends State<doList> {
  List<String> _tasks = ['Task 1', 'Task 2', 'Task 3'];
  final TextEditingController _taskController = TextEditingController();

  void _moveToDone(String task) {
    setState(() {
      _tasks.remove(task);
    });
  }

  void _addTask(String task) {
    if (task.isNotEmpty) {
      setState(() {
        _tasks.add(task);
      });
      _taskController.clear();
    }
  }

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Do List'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: InputDecoration(
                      labelText: 'Add New Task',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    _addTask(_taskController.text);
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_tasks[index]),
                  trailing: Checkbox(
                    value: false,
                    onChanged: (bool? value) {
                      _moveToDone(_tasks[index]);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
