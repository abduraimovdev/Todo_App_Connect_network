import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../service/body_todo_builder.dart';
import '../service/bottom_sheet.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeData.dark().canvasColor,
        title: const Text(
          "Todo App",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: const TodoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: addBtn,
        backgroundColor: ThemeData.dark().canvasColor,
        child: const Icon(
          CupertinoIcons.pencil,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  void addBtn() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => const CustomBottomSheet(),
    );
    setState(() {});
  }
}
