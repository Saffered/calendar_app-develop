import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_day.freezed.dart';
part 'remote_day.g.dart';

@freezed
class RemoteDay with _$RemoteDay {
  const factory RemoteDay(
      {@JsonKey(name: 'day') required num dayNumber,
      required num type,
      int? color}) = _RemoteDay;

  factory RemoteDay.fromJson(Map<String, Object?> json) =>
      _$RemoteDayFromJson(json);
}
