// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_args_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BoardArgsImpl _$$BoardArgsImplFromJson(Map<String, dynamic> json) =>
    _$BoardArgsImpl(
      appBartitle: json['appBartitle'] as String,
      gameMode: GameMode.fromJson(json['gameMode'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BoardArgsImplToJson(_$BoardArgsImpl instance) =>
    <String, dynamic>{
      'appBartitle': instance.appBartitle,
      'gameMode': instance.gameMode,
    };
