// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_mode_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GameMode _$GameModeFromJson(Map<String, dynamic> json) {
  return _GameMode.fromJson(json);
}

/// @nodoc
mixin _$GameMode {
  GameModeEnum get mode => throw _privateConstructorUsedError;
  bool get undoAllowed => throw _privateConstructorUsedError;
  int get dimension => throw _privateConstructorUsedError;

  /// Serializes this GameMode to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GameMode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameModeCopyWith<GameMode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameModeCopyWith<$Res> {
  factory $GameModeCopyWith(GameMode value, $Res Function(GameMode) then) =
      _$GameModeCopyWithImpl<$Res, GameMode>;
  @useResult
  $Res call({GameModeEnum mode, bool undoAllowed, int dimension});
}

/// @nodoc
class _$GameModeCopyWithImpl<$Res, $Val extends GameMode>
    implements $GameModeCopyWith<$Res> {
  _$GameModeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameMode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? undoAllowed = null,
    Object? dimension = null,
  }) {
    return _then(
      _value.copyWith(
            mode:
                null == mode
                    ? _value.mode
                    : mode // ignore: cast_nullable_to_non_nullable
                        as GameModeEnum,
            undoAllowed:
                null == undoAllowed
                    ? _value.undoAllowed
                    : undoAllowed // ignore: cast_nullable_to_non_nullable
                        as bool,
            dimension:
                null == dimension
                    ? _value.dimension
                    : dimension // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GameModeImplCopyWith<$Res>
    implements $GameModeCopyWith<$Res> {
  factory _$$GameModeImplCopyWith(
    _$GameModeImpl value,
    $Res Function(_$GameModeImpl) then,
  ) = __$$GameModeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GameModeEnum mode, bool undoAllowed, int dimension});
}

/// @nodoc
class __$$GameModeImplCopyWithImpl<$Res>
    extends _$GameModeCopyWithImpl<$Res, _$GameModeImpl>
    implements _$$GameModeImplCopyWith<$Res> {
  __$$GameModeImplCopyWithImpl(
    _$GameModeImpl _value,
    $Res Function(_$GameModeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameMode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? undoAllowed = null,
    Object? dimension = null,
  }) {
    return _then(
      _$GameModeImpl(
        mode:
            null == mode
                ? _value.mode
                : mode // ignore: cast_nullable_to_non_nullable
                    as GameModeEnum,
        undoAllowed:
            null == undoAllowed
                ? _value.undoAllowed
                : undoAllowed // ignore: cast_nullable_to_non_nullable
                    as bool,
        dimension:
            null == dimension
                ? _value.dimension
                : dimension // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GameModeImpl implements _GameMode {
  const _$GameModeImpl({
    this.mode = GameModeEnum.survivalMaxScore,
    this.undoAllowed = true,
    this.dimension = 4,
  }) : assert(
         dimension >= 4,
         'dimension must be greater than or equal to 4 -> (4x4)',
       );

  factory _$GameModeImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameModeImplFromJson(json);

  @override
  @JsonKey()
  final GameModeEnum mode;
  @override
  @JsonKey()
  final bool undoAllowed;
  @override
  @JsonKey()
  final int dimension;

  @override
  String toString() {
    return 'GameMode(mode: $mode, undoAllowed: $undoAllowed, dimension: $dimension)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameModeImpl &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.undoAllowed, undoAllowed) ||
                other.undoAllowed == undoAllowed) &&
            (identical(other.dimension, dimension) ||
                other.dimension == dimension));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, mode, undoAllowed, dimension);

  /// Create a copy of GameMode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameModeImplCopyWith<_$GameModeImpl> get copyWith =>
      __$$GameModeImplCopyWithImpl<_$GameModeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameModeImplToJson(this);
  }
}

abstract class _GameMode implements GameMode {
  const factory _GameMode({
    final GameModeEnum mode,
    final bool undoAllowed,
    final int dimension,
  }) = _$GameModeImpl;

  factory _GameMode.fromJson(Map<String, dynamic> json) =
      _$GameModeImpl.fromJson;

  @override
  GameModeEnum get mode;
  @override
  bool get undoAllowed;
  @override
  int get dimension;

  /// Create a copy of GameMode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameModeImplCopyWith<_$GameModeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
