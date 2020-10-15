import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_to_do_list/controller/to_do_controller.dart';
import 'package:getx_to_do_list/models/to_do.dart';

class TodoScreen extends StatelessWidget {
  final ToDoController toDoController = Get.find<ToDoController>();
  final int index;
  TodoScreen({this.index});

  @override
  Widget build(BuildContext context) {
    String text = '';
    if (!this.index.isNull) {
      // if its does not new, text gonna set by todocontroller index;
      text = toDoController.todos[index].text;
    }
    TextEditingController textController = TextEditingController(text: text);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Column(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    autofocus: true,
                    decoration: InputDecoration(
                        hintText: "What do you wannna do?",
                        border: InputBorder.none),
                    style: TextStyle(
                      fontSize: 25,
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: 100,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.red,
                    ),
                    RaisedButton(
                      onPressed: () {
                        if (this.index.isNull) {
                          toDoController.todos.add(
                            Todo(
                              text: textController.text.trim(),
                            ),
                          );
                        } else {
                          var editting = toDoController.todos[index];
                          editting.text = textController.text;
                          toDoController.todos[index] = editting;
                        }
                        Get.back();
                      },
                      child: Text(this.index.isNull ? 'Add' : "Edit"),
                      color: Colors.green,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
