// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_days_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RemoteDaysBaseImpl _$$RemoteDaysBaseImplFromJson(Map<String, dynamic> json) =>
    _$RemoteDaysBaseImpl(
      month: json['month'] as String,
      year: json['year'] as num,
      days: (json['days'] as List<dynamic>)
          .map((e) => RemoteDay.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RemoteDaysBaseImplToJson(
        _$RemoteDaysBaseImpl instance) =>
    <String, dynamic>{
      'month': instance.month,
      'year': instance.year,
      'days': instance.days,
    };
