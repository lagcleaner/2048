// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board_args_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BoardArgs _$BoardArgsFromJson(Map<String, dynamic> json) {
  return _BoardArgs.fromJson(json);
}

/// @nodoc
mixin _$BoardArgs {
  String get appBartitle => throw _privateConstructorUsedError;
  GameMode get gameMode => throw _privateConstructorUsedError;

  /// Serializes this BoardArgs to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BoardArgs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BoardArgsCopyWith<BoardArgs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardArgsCopyWith<$Res> {
  factory $BoardArgsCopyWith(BoardArgs value, $Res Function(BoardArgs) then) =
      _$BoardArgsCopyWithImpl<$Res, BoardArgs>;
  @useResult
  $Res call({String appBartitle, GameMode gameMode});

  $GameModeCopyWith<$Res> get gameMode;
}

/// @nodoc
class _$BoardArgsCopyWithImpl<$Res, $Val extends BoardArgs>
    implements $BoardArgsCopyWith<$Res> {
  _$BoardArgsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BoardArgs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? appBartitle = null, Object? gameMode = null}) {
    return _then(
      _value.copyWith(
            appBartitle:
                null == appBartitle
                    ? _value.appBartitle
                    : appBartitle // ignore: cast_nullable_to_non_nullable
                        as String,
            gameMode:
                null == gameMode
                    ? _value.gameMode
                    : gameMode // ignore: cast_nullable_to_non_nullable
                        as GameMode,
          )
          as $Val,
    );
  }

  /// Create a copy of BoardArgs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GameModeCopyWith<$Res> get gameMode {
    return $GameModeCopyWith<$Res>(_value.gameMode, (value) {
      return _then(_value.copyWith(gameMode: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BoardArgsImplCopyWith<$Res>
    implements $BoardArgsCopyWith<$Res> {
  factory _$$BoardArgsImplCopyWith(
    _$BoardArgsImpl value,
    $Res Function(_$BoardArgsImpl) then,
  ) = __$$BoardArgsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String appBartitle, GameMode gameMode});

  @override
  $GameModeCopyWith<$Res> get gameMode;
}

/// @nodoc
class __$$BoardArgsImplCopyWithImpl<$Res>
    extends _$BoardArgsCopyWithImpl<$Res, _$BoardArgsImpl>
    implements _$$BoardArgsImplCopyWith<$Res> {
  __$$BoardArgsImplCopyWithImpl(
    _$BoardArgsImpl _value,
    $Res Function(_$BoardArgsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BoardArgs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? appBartitle = null, Object? gameMode = null}) {
    return _then(
      _$BoardArgsImpl(
        appBartitle:
            null == appBartitle
                ? _value.appBartitle
                : appBartitle // ignore: cast_nullable_to_non_nullable
                    as String,
        gameMode:
            null == gameMode
                ? _value.gameMode
                : gameMode // ignore: cast_nullable_to_non_nullable
                    as GameMode,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BoardArgsImpl implements _BoardArgs {
  _$BoardArgsImpl({required this.appBartitle, required this.gameMode})
    : assert(appBartitle != '', 'Title must not be null');

  factory _$BoardArgsImpl.fromJson(Map<String, dynamic> json) =>
      _$$BoardArgsImplFromJson(json);

  @override
  final String appBartitle;
  @override
  final GameMode gameMode;

  @override
  String toString() {
    return 'BoardArgs(appBartitle: $appBartitle, gameMode: $gameMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoardArgsImpl &&
            (identical(other.appBartitle, appBartitle) ||
                other.appBartitle == appBartitle) &&
            (identical(other.gameMode, gameMode) ||
                other.gameMode == gameMode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, appBartitle, gameMode);

  /// Create a copy of BoardArgs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BoardArgsImplCopyWith<_$BoardArgsImpl> get copyWith =>
      __$$BoardArgsImplCopyWithImpl<_$BoardArgsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BoardArgsImplToJson(this);
  }
}

abstract class _BoardArgs implements BoardArgs {
  factory _BoardArgs({
    required final String appBartitle,
    required final GameMode gameMode,
  }) = _$BoardArgsImpl;

  factory _BoardArgs.fromJson(Map<String, dynamic> json) =
      _$BoardArgsImpl.fromJson;

  @override
  String get appBartitle;
  @override
  GameMode get gameMode;

  /// Create a copy of BoardArgs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BoardArgsImplCopyWith<_$BoardArgsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
