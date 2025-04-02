// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameStateImpl _$$GameStateImplFromJson(Map<String, dynamic> json) =>
    _$GameStateImpl(
      mode: GameMode.fromJson(json['mode'] as Map<String, dynamic>),
      tiles:
          (json['tiles'] as List<dynamic>?)
              ?.map((e) => Tile.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Tile>[],
      best: (json['best'] as num?)?.toInt() ?? 0,
      score: (json['score'] as num?)?.toInt() ?? 0,
      status:
          $enumDecodeNullable(_$GameStatusEnumMap, json['status']) ??
          GameStatus.stoped,
      undo:
          json['undo'] == null
              ? null
              : GameState.fromJson(json['undo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GameStateImplToJson(_$GameStateImpl instance) =>
    <String, dynamic>{
      'mode': instance.mode,
      'tiles': instance.tiles,
      'best': instance.best,
      'score': instance.score,
      'status': _$GameStatusEnumMap[instance.status]!,
      'undo': instance.undo,
    };

const _$GameStatusEnumMap = {
  GameStatus.playing: 'playing',
  GameStatus.over: 'over',
  GameStatus.won: 'won',
  GameStatus.paused: 'paused',
  GameStatus.stoped: 'stoped',
};
