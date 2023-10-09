// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RemoteDayImpl _$$RemoteDayImplFromJson(Map<String, dynamic> json) =>
    _$RemoteDayImpl(
      dayNumber: json['day'] as num,
      type: json['type'] as num,
      color: json['color'] as int?,
    );

Map<String, dynamic> _$$RemoteDayImplToJson(_$RemoteDayImpl instance) =>
    <String, dynamic>{
      'day': instance.dayNumber,
      'type': instance.type,
      'color': instance.color,
    };
