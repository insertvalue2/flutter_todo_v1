// 192.168.0.22
const baseUri = 'http://192.168.0.22:80'; // 본인 IP 주소
const pathUser = '/user';
const epSignUp = '$pathUser/sign-up';
const epSignIn = '$pathUser/sign-in';

const pathTodo = '/todos';
const epTodoList = '$pathTodo/all';
const epTodoById = '$pathTodo/{id}';
const epTodoCreate = '$pathTodo/create';
const epTodoUpdate = '$pathTodo/update/{id}';
const epTodoDelete = '$pathTodo/delete/{id}';

String buildPathParam(String basePath, int id) {
  // {id} 토큰을 실제 id 값으로 치환합니다.
  return basePath.replaceAll('{id}', id.toString());
}
