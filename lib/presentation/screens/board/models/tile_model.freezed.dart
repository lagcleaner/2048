// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Tile _$TileFromJson(Map<String, dynamic> json) {
  return _Tile.fromJson(json);
}

/// @nodoc
mixin _$Tile {
  String get id => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  int? get nextIndex => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get merged => throw _privateConstructorUsedError;

  /// Serializes this Tile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Tile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TileCopyWith<Tile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TileCopyWith<$Res> {
  factory $TileCopyWith(Tile value, $Res Function(Tile) then) =
      _$TileCopyWithImpl<$Res, Tile>;
  @useResult
  $Res call({
    String id,
    int index,
    @JsonKey(includeFromJson: false, includeToJson: false) int? nextIndex,
    int value,
    @JsonKey(includeFromJson: false, includeToJson: false) bool merged,
  });
}

/// @nodoc
class _$TileCopyWithImpl<$Res, $Val extends Tile>
    implements $TileCopyWith<$Res> {
  _$TileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Tile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? index = null,
    Object? nextIndex = freezed,
    Object? value = null,
    Object? merged = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            index:
                null == index
                    ? _value.index
                    : index // ignore: cast_nullable_to_non_nullable
                        as int,
            nextIndex:
                freezed == nextIndex
                    ? _value.nextIndex
                    : nextIndex // ignore: cast_nullable_to_non_nullable
                        as int?,
            value:
                null == value
                    ? _value.value
                    : value // ignore: cast_nullable_to_non_nullable
                        as int,
            merged:
                null == merged
                    ? _value.merged
                    : merged // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TileImplCopyWith<$Res> implements $TileCopyWith<$Res> {
  factory _$$TileImplCopyWith(
    _$TileImpl value,
    $Res Function(_$TileImpl) then,
  ) = __$$TileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    int index,
    @JsonKey(includeFromJson: false, includeToJson: false) int? nextIndex,
    int value,
    @JsonKey(includeFromJson: false, includeToJson: false) bool merged,
  });
}

/// @nodoc
class __$$TileImplCopyWithImpl<$Res>
    extends _$TileCopyWithImpl<$Res, _$TileImpl>
    implements _$$TileImplCopyWith<$Res> {
  __$$TileImplCopyWithImpl(_$TileImpl _value, $Res Function(_$TileImpl) _then)
    : super(_value, _then);

  /// Create a copy of Tile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? index = null,
    Object? nextIndex = freezed,
    Object? value = null,
    Object? merged = null,
  }) {
    return _then(
      _$TileImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        index:
            null == index
                ? _value.index
                : index // ignore: cast_nullable_to_non_nullable
                    as int,
        nextIndex:
            freezed == nextIndex
                ? _value.nextIndex
                : nextIndex // ignore: cast_nullable_to_non_nullable
                    as int?,
        value:
            null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                    as int,
        merged:
            null == merged
                ? _value.merged
                : merged // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TileImpl implements _Tile {
  _$TileImpl({
    required this.id,
    required this.index,
    @JsonKey(includeFromJson: false, includeToJson: false) this.nextIndex,
    required this.value,
    @JsonKey(includeFromJson: false, includeToJson: false) this.merged = false,
  });

  factory _$TileImpl.fromJson(Map<String, dynamic> json) =>
      _$$TileImplFromJson(json);

  @override
  final String id;
  @override
  final int index;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final int? nextIndex;
  @override
  final int value;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final bool merged;

  @override
  String toString() {
    return 'Tile(id: $id, index: $index, nextIndex: $nextIndex, value: $value, merged: $merged)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.nextIndex, nextIndex) ||
                other.nextIndex == nextIndex) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.merged, merged) || other.merged == merged));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, index, nextIndex, value, merged);

  /// Create a copy of Tile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TileImplCopyWith<_$TileImpl> get copyWith =>
      __$$TileImplCopyWithImpl<_$TileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TileImplToJson(this);
  }
}

abstract class _Tile implements Tile {
  factory _Tile({
    required final String id,
    required final int index,
    @JsonKey(includeFromJson: false, includeToJson: false) final int? nextIndex,
    required final int value,
    @JsonKey(includeFromJson: false, includeToJson: false) final bool merged,
  }) = _$TileImpl;

  factory _Tile.fromJson(Map<String, dynamic> json) = _$TileImpl.fromJson;

  @override
  String get id;
  @override
  int get index;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  int? get nextIndex;
  @override
  int get value;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get merged;

  /// Create a copy of Tile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TileImplCopyWith<_$TileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
