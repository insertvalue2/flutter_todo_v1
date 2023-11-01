import 'package:todo_v1/models/dto/todo_dot.dart';

import '../../models/entity/todo_entity.dart';

abstract class TodoRepository {
  Future<List<TodoEntity>> todoList();
  Future<TodoEntity> findByIdTodo(int todoId);
  Future<int> createTodo(TodoDto todoDto);
  Future<int> updateTodoById(TodoDto todoDto);
  Future<int> deleteById(int todoId);
}
