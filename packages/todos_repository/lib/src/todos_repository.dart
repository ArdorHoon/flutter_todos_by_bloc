import 'package:todos_api/todos_api.dart';

class TodosRepository {
  /// {@macro todos_repository}
  const TodosRepository({
    required TodosApi todosApi,
}) : _todosApi = todosApi;

  final TodosApi _todosApi;

  Stream<List<Todo>> getTodos() => _todosApi.getTodos();

  Future<void> saveTodo(Todo todo) => _todosApi.saveTodo(todo);
  Future<void> deleteTodo(String id) => _todosApi.deleteTodo(id);
  //모든 완료된 목록 삭제
  Future<int> clearCompleted() => _todosApi.clearCompleted();
  //모든 목록 complete하기
  Future<int> completeAll({required bool isCompleted}) =>
      _todosApi.completeAll(isCompleted: isCompleted);

}
