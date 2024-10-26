import 'package:flutter/material.dart';

class doneList extends StatefulWidget {
  @override
  _doneListState createState() => _doneListState();
}

class _doneListState extends State<doneList> {
  List<String> _doneTasks = ['Task 1'];

  void _deleteTask(String task) {
    setState(() {
      _doneTasks.remove(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Done List'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: _doneTasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_doneTasks[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _deleteTask(_doneTasks[index]),
            ),
          );
        },
      ),
    );
  }
}
