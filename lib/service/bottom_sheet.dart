import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_network/model/todo_model.dart';
import 'package:todo_network/service/network_service.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({
    super.key,
  });

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  final network = Network();

  final _globalKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  bool complate = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .8,
      height: MediaQuery.of(context).size.height * .6,
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * .2),
      decoration: BoxDecoration(
        border: Border.all(
          color: ThemeData.dark().canvasColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Form(
        key: _globalKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              controller: titleController,
              textAlign: TextAlign.center,
              validator: (value) => value!.isEmpty ? "Empty Title" : null,
              decoration: const InputDecoration(
                labelText: "Title",
                labelStyle: TextStyle(),
              ),
            ),
            const Text("is Complate ?"),
            Checkbox(
              splashRadius: 30,
              value: complate,
              onChanged: (value) => setState(() {
                complate = value!;
              }),
            ),
            TextButton(
              onPressed: addTodo,
              style: TextButton.styleFrom(
                minimumSize: const Size(200, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: ThemeData.dark().canvasColor,
              ),
              child: const Text(
                "Add",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addTodo() {
    if (_globalKey.currentState!.validate()) {
      addData(
        Todo(
          Random().nextInt(100),
          Random().nextInt(100),
          titleController.text.trim(),
          complate,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Succesfuly Created"),
        ),
      );
      Navigator.pop(context, [true]);
    }
  }

  void addData(Todo todo) async {
    final response =
        await network.post(Api.baseUrl, Api.todos.path, todo.toJson());
    print(response);
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }
}
