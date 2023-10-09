import 'package:freezed_annotation/freezed_annotation.dart';

part 'day_color_type.freezed.dart';
part 'day_color_type.g.dart';

@freezed
class DayColorType with _$DayColorType {
  const factory DayColorType({
    required int type,
    required String color,
  }) = _DayColorType;

  factory DayColorType.fromJson(Map<String, dynamic> json) =>
      _$DayColorTypeFromJson(json);
}
