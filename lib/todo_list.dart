import 'package:basic_todolist/screens/task_page.dart';
import 'package:basic_todolist/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Todo> tasks = [];

  TextEditingController txt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(label: Text('add task')),
            controller: txt,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    title: Text(tasks[index].title),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TaskPage(
                              task: tasks[index],
                            ),
                          ));
                    },
                  );
                })),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(50),
            ),
            child: Text('ADD'),
            onPressed: () {
              if (!txt.text.isEmpty) {
                setState(() {
                  tasks.add(Todo(txt.text, 'description: ${txt.text}:'));
                });
              }
              txt.text = '';
            },
          )
        ],
      ),
    );
  }
}
