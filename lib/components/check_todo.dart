import 'package:flutter/material.dart';

class CheckTodo extends StatefulWidget {
  final bool visible;
  final void Function(bool? value) onChanged;
  final String label;

  const CheckTodo({
    super.key,
    required this.visible,
    required this.onChanged,
    required this.label,
  });

  @override
  State<CheckTodo> createState() => _CheckTodoState();
}

class _CheckTodoState extends State<CheckTodo> {
  bool isVisible = false;
  @override
  void initState() {
    super.initState();
    isVisible = widget.visible;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      
      onTap: () => setState(() {
        isVisible = !isVisible;
        widget.onChanged(isVisible);
      }),
      title: Text(
        widget.label,
        style: TextStyle(
          color: isVisible ? Colors.grey : Colors.black,
          decoration:
              isVisible ? TextDecoration.lineThrough : TextDecoration.none,
          decorationColor: Colors.grey,
        ),
      ),
      leading: SizedBox(
        width: 40,
        height: 40,
        child: isVisible
            ? const Icon(
                Icons.check,
                color: Colors.green,
              )
            : const Icon(
                Icons.check_box_outline_blank_outlined,
                color: Colors.grey,
              ),
      ),
    );
  }
}
