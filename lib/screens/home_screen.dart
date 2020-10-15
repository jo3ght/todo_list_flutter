import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_to_do_list/controller/to_do_controller.dart';
import 'package:getx_to_do_list/screens/to_do_screen.dart';

class HomeScreen extends StatelessWidget {
  final ToDoController toDoController = Get.put(ToDoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do App"),
        centerTitle: true,
      ),
      body: Container(
        child: Obx(
          () => ListView.separated(
            itemBuilder: (context, index) => Container(
              child: Card(
                margin: EdgeInsets.all(10),
                child: Dismissible(
                  key: UniqueKey(),
                  onDismissed: (_) {
                    var removed = toDoController.todos[index];
                    toDoController.todos.removeAt(index);
                    Get.snackbar("To do list", "Removed ${removed.text}",
                        mainButton: FlatButton(
                            onPressed: () {
                              toDoController.todos.insert(index, removed);
                            },
                            child: Text("Undo")));
                  },
                  child: ListTile(
                    title: Text(
                      toDoController.todos[index].text,
                      style: (toDoController.todos[index].done)
                          ? TextStyle(
                              color: Colors.red,
                              decoration: TextDecoration.lineThrough)
                          : TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Get.to(TodoScreen(index: index));
                    },
                    leading: Checkbox(
                      value: toDoController.todos[index].done,
                      onChanged: (val) {
                        var changed = toDoController.todos[index];
                        changed.done = val;
                        toDoController.todos[index] = changed;
                      },
                    ),
                    trailing: Icon(Icons.chevron_right),
                  ),
                ),
              ),
            ),
            separatorBuilder: (context, index) => Divider(),
            itemCount: toDoController.todos.length,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(
          TodoScreen(),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
