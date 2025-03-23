// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_arguments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardArgumentsModel _$BoardArgumentsModelFromJson(Map<String, dynamic> json) =>
    BoardArgumentsModel(
      mode: $enumDecode(_$BoardModeEnumEnumMap, json['mode']),
      appBartitle: json['appBartitle'] as String,
      undoLastMoveAvailable: json['undoLastMoveAvailable'] as bool,
      dimension: (json['dimension'] as num?)?.toInt() ?? 4,
    );

Map<String, dynamic> _$BoardArgumentsModelToJson(
  BoardArgumentsModel instance,
) => <String, dynamic>{
  'mode': _$BoardModeEnumEnumMap[instance.mode]!,
  'appBartitle': instance.appBartitle,
  'undoLastMoveAvailable': instance.undoLastMoveAvailable,
  'dimension': instance.dimension,
};

const _$BoardModeEnumEnumMap = {
  BoardModeEnum.survivalMaxScore: 'survivalMaxScore',
  BoardModeEnum.timeRecord: 'timeRecord',
};
