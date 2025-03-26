// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_mode_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameModeImpl _$$GameModeImplFromJson(Map<String, dynamic> json) =>
    _$GameModeImpl(
      mode:
          $enumDecodeNullable(_$GameModeEnumEnumMap, json['mode']) ??
          GameModeEnum.survivalMaxScore,
      undoAllowed: json['undoAllowed'] as bool? ?? true,
      dimension: (json['dimension'] as num?)?.toInt() ?? 4,
    );

Map<String, dynamic> _$$GameModeImplToJson(_$GameModeImpl instance) =>
    <String, dynamic>{
      'mode': _$GameModeEnumEnumMap[instance.mode]!,
      'undoAllowed': instance.undoAllowed,
      'dimension': instance.dimension,
    };

const _$GameModeEnumEnumMap = {
  GameModeEnum.survivalMaxScore: 'survivalMaxScore',
  GameModeEnum.timeRecord: 'timeRecord',
};
