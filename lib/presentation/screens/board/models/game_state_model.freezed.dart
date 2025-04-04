// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GameState _$GameStateFromJson(Map<String, dynamic> json) {
  return _GameState.fromJson(json);
}

/// @nodoc
mixin _$GameState {
  @JsonKey(includeToJson: true)
  GameMode get mode => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: true)
  List<Tile> get tiles => throw _privateConstructorUsedError;
  int get best => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  GameStatus get status => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: true)
  GameState? get undo => throw _privateConstructorUsedError;

  /// Serializes this GameState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameStateCopyWith<GameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res, GameState>;
  @useResult
  $Res call({
    @JsonKey(includeToJson: true) GameMode mode,
    @JsonKey(includeToJson: true) List<Tile> tiles,
    int best,
    int score,
    GameStatus status,
    @JsonKey(includeToJson: true) GameState? undo,
  });

  $GameModeCopyWith<$Res> get mode;
  $GameStateCopyWith<$Res>? get undo;
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res, $Val extends GameState>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? tiles = null,
    Object? best = null,
    Object? score = null,
    Object? status = null,
    Object? undo = freezed,
  }) {
    return _then(
      _value.copyWith(
            mode:
                null == mode
                    ? _value.mode
                    : mode // ignore: cast_nullable_to_non_nullable
                        as GameMode,
            tiles:
                null == tiles
                    ? _value.tiles
                    : tiles // ignore: cast_nullable_to_non_nullable
                        as List<Tile>,
            best:
                null == best
                    ? _value.best
                    : best // ignore: cast_nullable_to_non_nullable
                        as int,
            score:
                null == score
                    ? _value.score
                    : score // ignore: cast_nullable_to_non_nullable
                        as int,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as GameStatus,
            undo:
                freezed == undo
                    ? _value.undo
                    : undo // ignore: cast_nullable_to_non_nullable
                        as GameState?,
          )
          as $Val,
    );
  }

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GameModeCopyWith<$Res> get mode {
    return $GameModeCopyWith<$Res>(_value.mode, (value) {
      return _then(_value.copyWith(mode: value) as $Val);
    });
  }

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GameStateCopyWith<$Res>? get undo {
    if (_value.undo == null) {
      return null;
    }

    return $GameStateCopyWith<$Res>(_value.undo!, (value) {
      return _then(_value.copyWith(undo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GameStateImplCopyWith<$Res>
    implements $GameStateCopyWith<$Res> {
  factory _$$GameStateImplCopyWith(
    _$GameStateImpl value,
    $Res Function(_$GameStateImpl) then,
  ) = __$$GameStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(includeToJson: true) GameMode mode,
    @JsonKey(includeToJson: true) List<Tile> tiles,
    int best,
    int score,
    GameStatus status,
    @JsonKey(includeToJson: true) GameState? undo,
  });

  @override
  $GameModeCopyWith<$Res> get mode;
  @override
  $GameStateCopyWith<$Res>? get undo;
}

/// @nodoc
class __$$GameStateImplCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$GameStateImpl>
    implements _$$GameStateImplCopyWith<$Res> {
  __$$GameStateImplCopyWithImpl(
    _$GameStateImpl _value,
    $Res Function(_$GameStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? tiles = null,
    Object? best = null,
    Object? score = null,
    Object? status = null,
    Object? undo = freezed,
  }) {
    return _then(
      _$GameStateImpl(
        mode:
            null == mode
                ? _value.mode
                : mode // ignore: cast_nullable_to_non_nullable
                    as GameMode,
        tiles:
            null == tiles
                ? _value._tiles
                : tiles // ignore: cast_nullable_to_non_nullable
                    as List<Tile>,
        best:
            null == best
                ? _value.best
                : best // ignore: cast_nullable_to_non_nullable
                    as int,
        score:
            null == score
                ? _value.score
                : score // ignore: cast_nullable_to_non_nullable
                    as int,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as GameStatus,
        undo:
            freezed == undo
                ? _value.undo
                : undo // ignore: cast_nullable_to_non_nullable
                    as GameState?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$GameStateImpl implements _GameState {
  _$GameStateImpl({
    @JsonKey(includeToJson: true) required this.mode,
    @JsonKey(includeToJson: true) final List<Tile> tiles = const <Tile>[],
    this.best = 0,
    this.score = 0,
    this.status = GameStatus.stoped,
    @JsonKey(includeToJson: true) this.undo,
  }) : _tiles = tiles;

  factory _$GameStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameStateImplFromJson(json);

  @override
  @JsonKey(includeToJson: true)
  final GameMode mode;
  final List<Tile> _tiles;
  @override
  @JsonKey(includeToJson: true)
  List<Tile> get tiles {
    if (_tiles is EqualUnmodifiableListView) return _tiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tiles);
  }

  @override
  @JsonKey()
  final int best;
  @override
  @JsonKey()
  final int score;
  @override
  @JsonKey()
  final GameStatus status;
  @override
  @JsonKey(includeToJson: true)
  final GameState? undo;

  @override
  String toString() {
    return 'GameState(mode: $mode, tiles: $tiles, best: $best, score: $score, status: $status, undo: $undo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStateImpl &&
            (identical(other.mode, mode) || other.mode == mode) &&
            const DeepCollectionEquality().equals(other._tiles, _tiles) &&
            (identical(other.best, best) || other.best == best) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.undo, undo) || other.undo == undo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    mode,
    const DeepCollectionEquality().hash(_tiles),
    best,
    score,
    status,
    undo,
  );

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      __$$GameStateImplCopyWithImpl<_$GameStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameStateImplToJson(this);
  }
}

abstract class _GameState implements GameState {
  factory _GameState({
    @JsonKey(includeToJson: true) required final GameMode mode,
    @JsonKey(includeToJson: true) final List<Tile> tiles,
    final int best,
    final int score,
    final GameStatus status,
    @JsonKey(includeToJson: true) final GameState? undo,
  }) = _$GameStateImpl;

  factory _GameState.fromJson(Map<String, dynamic> json) =
      _$GameStateImpl.fromJson;

  @override
  @JsonKey(includeToJson: true)
  GameMode get mode;
  @override
  @JsonKey(includeToJson: true)
  List<Tile> get tiles;
  @override
  int get best;
  @override
  int get score;
  @override
  GameStatus get status;
  @override
  @JsonKey(includeToJson: true)
  GameState? get undo;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
