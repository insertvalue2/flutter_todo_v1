import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:todo_v1/models/dto/todo_dot.dart';
import 'package:todo_v1/models/entity/todo_entity.dart';
import 'package:todo_v1/repository/remote/todo_repository.dart';
import 'package:todo_v1/shared/api.dart';
import 'package:todo_v1/shared/http.dart';

class TodoRepositoryImpl extends TodoRepository {
  Future<int> todoTest() async {
    try {
      Response response = await dio.get('/todos/test');
      return response.data;
    } catch (e) {
      return -1;
    }
  }

  @override
  Future<int> createTodo(TodoDto todoDto) async {
    try {
      print('flutter  - 1');
      print("todoDto : ${todoDto.toString()}");
      print(dio.options.baseUrl); // 현재 URI 출력
      Response response = await dio.post(epTodoCreate);
      print('reponse : ${response.toString()}');
      return response.data;
    } catch (e) {
      return -1;
    }
  }

  @override
  Future<int> deleteById(int todoId) {
    // TODO: implement deleteById
    throw UnimplementedError();
  }

  @override
  Future<TodoEntity> findByIdTodo(int todoId) {
    // TODO: implement findByIdTodo
    throw UnimplementedError();
  }

  @override
  Future<List<TodoEntity>> todoList() {
    // TODO: implement todoList
    throw UnimplementedError();
  }

  @override
  Future<int> updateTodoById(TodoDto todoDto) {
    // TODO: implement updateTodoById
    throw UnimplementedError();
  }
}
