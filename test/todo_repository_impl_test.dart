import 'package:flutter_test/flutter_test.dart';
import 'package:todo_v1/models/dto/todo_dot.dart';
import 'package:todo_v1/models/dto/user_dto.dart';
import 'package:todo_v1/models/entity/todo_entity.dart';
import 'package:todo_v1/repository/remote/todo_repository.dart';
import 'package:todo_v1/repository/remote/todo_repository_impl.dart';
import 'package:todo_v1/repository/remote/user_repository.dart';
import 'package:todo_v1/repository/remote/user_repository_impl.dart';

void main() {
  late TodoRepository todoRepository;
  late UserRepository userRepository;
  late UserDto userDto;

  setUp(() async {
    userRepository = UserRepositoryImpl();
    userDto = UserDto(
      email: 'hong@example.com',
      password: 'hong1234',
    );
    await userRepository.signIn(userDto);
    todoRepository = TodoRepositoryImpl();
  });

  group('TodoRepository TES', () {
    test('Todo 등록 테스트', () async {
      // given

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

    test("todo 전체 조회 테스트 ", () async {
      // when
      List<TodoEntity> todoList = await todoRepository.todoList();

      // then
      expect(todoList, isA<List<TodoEntity>>());
      expect(todoList.every((todo) => todo.title.isNotEmpty), isTrue);
    });
  });

  // 수정

  // 삭제
}
