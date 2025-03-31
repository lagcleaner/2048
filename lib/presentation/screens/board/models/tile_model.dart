// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tile_model.freezed.dart';
part 'tile_model.g.dart';

@freezed
abstract class Tile with _$Tile {
  factory Tile({
    required String id,
    required int index,
    @JsonKey(includeFromJson: false, includeToJson: false) int? nextIndex,
    required int value,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(false)
    bool merged,
  }) = _Tile;

  factory Tile.fromJson(Map<String, dynamic> json) => _$TileFromJson(json);
}

extension TileExtension on Tile {
  //Calculate the current top position based on the current index
  double getTop(double size, int dimension) {
    var i = ((index + 1) / dimension).ceil();
    return ((i - 1) * size) + (12.0 * i);
  }

  //Calculate the current left position based on the current index
  double getLeft(double size, int dimension) {
    var i =
        (index - (((index + 1) / dimension).ceil() * dimension - dimension));
    return (i * size) + (12.0 * (i + 1));
  }

  //Calculate the next top position based on the next index
  double? getNextTop(double size, int dimension) {
    if (nextIndex == null) return null;
    var i = ((nextIndex! + 1) / dimension).ceil();
    return ((i - 1) * size) + (12.0 * i);
  }

  //Calculate the next top position based on the next index
  double? getNextLeft(double size, int dimension) {
    if (nextIndex == null) return null;
    var i =
        (nextIndex! -
            (((nextIndex! + 1) / dimension).ceil() * dimension - dimension));
    return (i * size) + (12.0 * (i + 1));
  }
}
