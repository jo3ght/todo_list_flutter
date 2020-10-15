import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_to_do_list/models/to_do.dart';

class ToDoController extends GetxController {
  var todos = List<Todo>().obs;

  @override
  void onInit() {
    List stroredTodos = GetStorage().read<List>('todos');
    if (!stroredTodos.isNull) {
      todos = stroredTodos.map((e) => Todo.fromJson(e)).toList().obs;
      // todos = RxList(stroredTodos.map((e) => Todo.fromJson(e)).toList());
    }
    ever(todos, (_) {
      GetStorage().write('todos', todos.toList());
    });
    super.onInit();
  }
}
