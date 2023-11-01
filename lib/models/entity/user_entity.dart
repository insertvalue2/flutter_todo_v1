class UserEntity {
  int userId;
  String username;
  String email;

  UserEntity({
    required this.userId,
    required this.username,
    required this.email,
  });

  // 객체 생성시 JSON 형식에 문자열 받아서 UserEntity 인스턴스를 생성 하자.

  // factory 생성자
  // 클래스의 생성자 중 하나로서 객체 생성 로직을 클래스 내부에 구현합니다.
  // 재정의 불가 클래스의 일부로 사용 됨.
  // 가능한 동일한 인스턴스를 반환(객체의 수명과 범워에 따라 싱글톤 패턴과 다를 수 있음)

  // factory 메서드
  // Factory 메서드는 클래스의 메서드입니다.
  // 보통 클래스의 인스턴스를 생성하고 반환하는 역할을 합니다.
  // 객체 생성 로직을 캡슐화 합니다. 서브 클래스에서 재정의 가능
  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      userId: json['userId'] as int,
      username: json['username'] as String,
      email: json['email'] as String,
    );
  }
}
