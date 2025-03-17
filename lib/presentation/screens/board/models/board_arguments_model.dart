// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:game2048/presentation/screens/board/models/board_mode_enum.dart';

class BoardArgumentsModel {
  final BoardModeEnum mode;
  final String appBartitle;
  final bool undoLastMoveAvailable;
  final ({int rows, int cols}) dimension;

  BoardArgumentsModel({
    required this.mode,
    required this.appBartitle,
    required this.undoLastMoveAvailable,
    this.dimension = (rows: 4, cols: 4),
  }) : assert(
         dimension.rows >= 4 && dimension.cols >= 4,
         'dimension must be greater than or equal to 4x4',
       ),
       assert(appBartitle != '', 'board title must not be null');

  static final BoardArgumentsModel survivalDefaultArgs = BoardArgumentsModel(
    mode: BoardModeEnum.survivalMaxScore,
    appBartitle: 'Survival',
    undoLastMoveAvailable: true,
    dimension: (rows: 4, cols: 4),
  );
  static final BoardArgumentsModel timeRecordDefaultArgs = BoardArgumentsModel(
    mode: BoardModeEnum.timeRecord,
    appBartitle: 'Time Record',
    undoLastMoveAvailable: true,
    dimension: (rows: 4, cols: 4),
  );

  BoardArgumentsModel copyWith({
    BoardModeEnum? mode,
    String? appBartitle,
    bool? undoLastMoveAvailable,
    ({int rows, int cols})? dimension,
  }) {
    return BoardArgumentsModel(
      mode: mode ?? this.mode,
      appBartitle: appBartitle ?? this.appBartitle,
      undoLastMoveAvailable:
          undoLastMoveAvailable ?? this.undoLastMoveAvailable,
      dimension: dimension ?? this.dimension,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'mode': mode.index,
      'appBartitle': appBartitle,
      'undoLastMoveAvailable': undoLastMoveAvailable,
      'rows': dimension.rows,
      'cols': dimension.cols,
    };
  }

  factory BoardArgumentsModel.fromMap(Map<String, dynamic> map) {
    return BoardArgumentsModel(
      mode: BoardModeEnum.values[(map['mode'] as int)],
      appBartitle: map['appBartitle'] as String,
      undoLastMoveAvailable: map['undoLastMoveAvailable'] as bool,
      dimension: (rows: (map['rows'] as int), cols: (map['cols'] as int)),
    );
  }

  String toJson() => json.encode(toMap());

  factory BoardArgumentsModel.fromJson(String source) =>
      BoardArgumentsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BoardArgumentsModel(mode: $mode, appBartitle: $appBartitle, undoLastMoveAvailable: $undoLastMoveAvailable, dimension: $dimension)';
  }

  @override
  bool operator ==(covariant BoardArgumentsModel other) {
    if (identical(this, other)) return true;

    return other.mode == mode &&
        other.appBartitle == appBartitle &&
        other.undoLastMoveAvailable == undoLastMoveAvailable &&
        other.dimension == dimension;
  }

  @override
  int get hashCode {
    return mode.hashCode ^
        appBartitle.hashCode ^
        undoLastMoveAvailable.hashCode ^
        dimension.hashCode;
  }
}
