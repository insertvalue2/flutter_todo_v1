import 'package:dio/dio.dart';
import 'api.dart';

// Dio 클라이언트를 생성합니다.
Dio dio = Dio(
  BaseOptions(
    baseUrl: baseUri, // 내 IP 입력
    contentType: "application/json; charset=utf-8",
  ),
);

// JWT 토큰을 저장할 변수
String? jwtToken;

// Dio Interceptor를 생성합니다.
final jwtInterceptor = InterceptorsWrapper(
  onRequest: (options, handler) {
    // 요청 전에 JWT 토큰을 헤더에 추가합니다.
    if (jwtToken != null) {
      options.headers['Authorization'] = '$jwtToken';
    }
    handler.next(options);
  },
);

//
// // Dio 클라이언트에 Interceptor를 추가합니다.
// dio.interceptors.add(jwtInterceptor);
//
// // JWT 토큰을 설정하는 함수
// void setJwtToken(String token) {
// jwtToken = token;
// }
//
// // 예제: JWT 토큰 설정
// setJwtToken('your_jwt_token_here');
//
// // 이제 Dio 클라이언트를 사용하여 HTTP 요청을 보낼 때 JWT 토큰이 자동으로 헤더에 추가됩니다.
