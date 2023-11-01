import 'package:flutter_test/flutter_test.dart';
import 'package:todo_v1/models/dto/todo_dot.dart';
import 'package:todo_v1/repository/remote/todo_repository.dart';
import 'package:todo_v1/repository/remote/todo_repository_impl.dart';
import 'package:todo_v1/repository/remote/user_repository.dart';

void main() {
  late TodoRepositoryImpl todoRepository;
  late UserRepository userRepository;
  // late TodoDto mockTodo;

  setUp(() async {});

  group('TodoRepository TES', () {
    test('Todo 등록 테스트', () async {
      // given
      todoRepository = TodoRepositoryImpl();
      TodoDto mockTodo = TodoDto(title: 'todo test1', completed: false);

      // when
      int result = await todoRepository.createTodo(mockTodo);
      //int result = await todoRepository.todoTest();
      print("result : ${result}");
      // then
      // 데이터 타입 확인
      expect(result, isA<int>());
      expect(result, 1);
    });
  });
}
