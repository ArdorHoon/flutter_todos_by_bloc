import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:todos_api/todos_api.dart';
import 'package:uuid/uuid.dart';

part 'todo.g.dart';


@immutable
@JsonSerializable()
class Todo extends Equatable {
  /// {@macro todo_item}
  Todo({
    required this.title,
    String? id,
    this.description = '',
    this.isCompleted = false,
  })  : assert(
  id == null || id.isNotEmpty,
  'id must either be null or not empty',
  ),
        id = id ?? const Uuid().v4();


  final String id;
  final String title;

  /// The description of the `todo`.
  ///
  /// Defaults to an empty string.
  final String description;

  /// Whether the `todo` is completed.
  ///
  /// Defaults to `false`.
  final bool isCompleted;

  /// Returns a copy of this `todo` with the given values updated.
  ///
  /// {@macro todo_item}
  Todo copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  /// Deserializes the given [JsonMap] into a [Todo].
  static Todo fromJson(JsonMap json) => _$TodoFromJson(json);

  /// Converts this [Todo] into a [JsonMap].
  JsonMap toJson() => _$TodoToJson(this);

  @override
  List<Object> get props => [id, title, description, isCompleted];
}