import 'package:flutter_test/flutter_test.dart';
import 'package:todo_v1/models/dto/user_dto.dart';
import 'package:todo_v1/models/entity/user_entity.dart';
import 'package:todo_v1/repository/remote/user_repository.dart';
import 'package:todo_v1/repository/remote/user_repository_impl.dart';

void main() {
  late UserRepository userRepository;

  setUp(() {
    userRepository = UserRepositoryImpl();
  });

  group('UserRepository TEST', () {
    test('로그인 테스트', () async {
      // given
      UserDto dto = UserDto(
        email: 'hong@example.com',
        password: 'hong1234',
      );

      // when
      UserEntity userEntity = await userRepository.signIn(dto);

      // then
      // 데이터 타입 확인
      expect(userEntity, isA<UserEntity>());
      expect(userEntity.username, '홍길동');
    });

    test('회원 가입 테스트', () async {
      // given
      UserDto newUser =
          UserDto(username: 'user1', email: 't11@naver.com', password: '1234');
      // when
      int result = await userRepository.signUp(newUser);

      // then
      expect(result, isA<int>());
      expect(result, equals(1)); // 값 일치 여부 확인
    });
  });
}
