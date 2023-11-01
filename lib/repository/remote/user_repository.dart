import '../../models/dto/user_dto.dart';
import '../../models/entity/user_entity.dart';

abstract class UserRepository {
  Future<int> signUp(UserDto userDto);
  Future<UserEntity> signIn(UserDto userDto);
}
