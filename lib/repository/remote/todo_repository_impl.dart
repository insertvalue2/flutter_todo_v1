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
  Future<int> deleteById(int todoId) async {
    try {
      // dio.delete(path) // path valiable 방식으로 설정하지
      // @DeleteMapping("/delete/{id}") <--- 서버측 코드야
      Response response = await dio.get(epTodoDelete);
      // response.data를 List<TodoEntity>로 변환
      return 1;
    } catch (e) {
      return -1;
    }
  }

  @override
  Future<TodoEntity> findByIdTodo(int todoId) {
    // TODO: implement findByIdTodo
    throw UnimplementedError();
  }

  @override
  Future<List<TodoEntity>> todoList() async {
    try {
      Response response = await dio.get(epTodoList);
      // response.data를 List<TodoEntity>로 변환
      final list = response.data as List;
      print('list : $list');
      List<TodoEntity> todoList =
          list.map((e) => TodoEntity.fromJson(e)).toList();
      return todoList;
    } catch (e) {
      // 에러가 발생할 경우 빈 리스트를 반환하거나, 예외를 재발생 시키는 것이 일반적입니다.
      return []; // 빈 리스트 반환
      //throw Exception('Failed to load todo list'); // 예외 재발생
    }
  }

  @override
  Future<int> updateTodoById(TodoDto todoDto) async {
    try {
      Response response = await dio.get(epTodoList);
      print(response.toString());
    } catch (e) {}

    throw UnimplementedError();
  }
}
