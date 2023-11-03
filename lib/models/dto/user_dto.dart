class UserDto {
  String? username; // 로그인 요청시 필요 없는 상태
  String email;
  String password;

  UserDto({this.username, required this.email, required this.password});

  //생각해 보기!!
  // 요청 HTTP 메서드 생성시 MIME TYPE  header 에 application/json 형식 일 때
  // body 영역에 json 형식에 문자열 보내는 규칙, 즉 약속을 명시 하고 있다.
  // 즉 object type(클래스인스턴스)을 JSON 형식에 문자열로 변경 해주어야 한다.

  // 생각 단계
  // why JSON 형식에 문자열을 만드는데 Map 구조를 사용할까?
  // 키-값 쌍을 저장하는 데이터 구조 이다.

  // dart lib -> dart:convert 라이브러에서 jsonEncode 함수를 사용하면 문자열로 변경해준다.
  Map<String, dynamic> toJson() {
    return {
      'username': username ?? '',
      'email': email,
      'password': password,
    };
  }
}
