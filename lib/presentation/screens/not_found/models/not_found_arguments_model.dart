// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NotFoundArgumentsModel {
  final String routeNotFound;
  final dynamic arguments;

  NotFoundArgumentsModel({
    required this.routeNotFound,
    required this.arguments,
  });

  NotFoundArgumentsModel copyWith({String? routeNotFound, dynamic arguments}) {
    return NotFoundArgumentsModel(
      routeNotFound: routeNotFound ?? this.routeNotFound,
      arguments: arguments ?? this.arguments,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'routeNotFound': routeNotFound,
      'arguments': arguments,
    };
  }

  factory NotFoundArgumentsModel.fromMap(Map<String, dynamic> map) {
    return NotFoundArgumentsModel(
      routeNotFound: map['routeNotFound'] as String,
      arguments: map['arguments'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotFoundArgumentsModel.fromJson(String source) =>
      NotFoundArgumentsModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() =>
      'NotFoundArgumentsModel(routeNotFound: $routeNotFound, arguments: $arguments)';

  @override
  bool operator ==(covariant NotFoundArgumentsModel other) {
    if (identical(this, other)) return true;

    return other.routeNotFound == routeNotFound && other.arguments == arguments;
  }

  @override
  int get hashCode => routeNotFound.hashCode ^ arguments.hashCode;
}
