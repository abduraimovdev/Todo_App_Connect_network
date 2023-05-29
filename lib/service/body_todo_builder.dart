import 'package:flutter/material.dart';

import '../components/check_todo.dart';
import '../model/todo_model.dart';
import 'network_service.dart';

class TodoList extends StatefulWidget {
  const TodoList({
    super.key,
  });

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final network = Network();
  List<Todo> todos = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await _refresh();
  }

  Future<void> _refresh() async {
    setState(() => todos = []);
    final response = await network.get(Api.baseUrl, Api.todos.path);
    todos = network.parseAllPost(response);
    setState(() {});
    return Future.delayed(const Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: Stack(
        children: [
          ListView.separated(
            itemCount: todos.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) => CheckTodo(
              visible: todos[index].completed,
              onChanged: (newValue) {},
              label: todos[index].title,
            ),
          ),
        ],
      ),
    );
  }
}
