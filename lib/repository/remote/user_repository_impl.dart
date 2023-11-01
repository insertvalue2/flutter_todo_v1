import 'package:dio/dio.dart';
import 'package:todo_v1/repository/remote/user_repository.dart';

import '../../models/dto/user_dto.dart';
import '../../models/entity/user_entity.dart';
import '../../shared/api.dart';
import '../../shared/http.dart';

// 싱글톤 처리
class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl._single();
  static final UserRepositoryImpl _instance = UserRepositoryImpl._single();

  // factory 생성자
  factory UserRepositoryImpl() {
    return _instance;
  }

  @override
  Future<UserEntity> signIn(UserDto userDto) async {
    try {
      print('userDto : $userDto');
      print('epSignIn : $baseUri$epSignIn');

      // / 클래스 인스턴스를 넣으면  알아서 json 형식 으로 변경 처리 해 준다.
      Response response = await dio.post(epSignIn, data: userDto);
      print("----------------");
      print(response.toString());
      print("----------------");
      print("response.data : ${response.data.runtimeType}");
      print("response.data : ${response.data}");

      print("test ${response.headers['Authorization']}");
      print("test ${response.headers['Authorization'].runtimeType}");
      // 직접 헤더를 설정 1 단계
      dio.options.headers['Authorization'] = response.headers['Authorization'];
      //jwtToken = response.headers['Authorization'] as String?;
      return UserEntity.fromJson(response.data);
    } catch (e) {
      return UserEntity(userId: -1, username: '', email: '');
    }
  }

  @override
  Future<int> signUp(UserDto userDto) async {
    try {
      Response response = await dio.post(epSignUp, data: userDto);
      return response.data;
    } catch (e) {
      return -1;
    }
  }
}
