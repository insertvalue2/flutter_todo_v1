import 'package:dio/dio.dart';

import 'package:todo_v1/models/dto/todo_dot.dart';
import 'package:todo_v1/models/entity/todo_entity.dart';
import 'package:todo_v1/repository/remote/todo_repository.dart';
import 'package:todo_v1/shared/api.dart';
import 'package:todo_v1/shared/http.dart';
// 릴리즈, 디버그 모드 구분
import 'package:flutter/foundation.dart';

/// 기본 생성자를 private으로 만들어 클래스 외부에서 새 인스턴스를 생성하지 못하게 합니다.
/// 클래스 내부에 static final 변수를 선언하여 유일한 인스턴스를 보유합니다.
/// factory 생성자를 통해 해당 싱글턴 인스턴스에 접근할 수 있는 방법을 제공합니다.
class TodoRepositoryImpl extends TodoRepository {
  TodoRepositoryImpl._single();
  static final TodoRepositoryImpl _instance = TodoRepositoryImpl._single();

  // factory 생성자
  // 외부에서 호출 _instance == TodoRepositoryImpl() --> true 결과값이 나옴
  factory TodoRepositoryImpl() {
    return _instance;
  }

  // Private helper methods
  void _log(dynamic message) {
    if (kDebugMode) {
      debugPrint(message.toString());
    }
  }

  @override
  Future<int> createTodo(TodoDto todoDto) async {
    try {
      _log(dio.options.baseUrl); // 현재 URI 출력
      Response response = await dio.post(epTodoCreate, data: todoDto);
      return response.data;
    } catch (e) {
      return -1;
    }
  }

  @override
  Future<int> deleteById(int todoId) async {
    try {
      Response response =
          await dio.delete(buildPathParam(epTodoDelete, todoId));
      return response.data;
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
      _log('list : $list');
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
  Future<int> updateTodoById(TodoDto todoDto, int id) async {
    try {
      Response response =
          await dio.put(buildPathParam(epTodoUpdate, id), data: todoDto);
      // import 'package:flutter/foundation.dart';
      // kReleaseMode - 릴리즈 모드
      // kDebugMode - 디버그 모드
      if (kDebugMode) {
        debugPrint(response.toString());
      }
      return response.data;
    } catch (e) {
      _log(e);
      return -1;
    }
  }
}
