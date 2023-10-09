// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_day.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RemoteDay _$RemoteDayFromJson(Map<String, dynamic> json) {
  return _RemoteDay.fromJson(json);
}

/// @nodoc
mixin _$RemoteDay {
  @JsonKey(name: 'day')
  num get dayNumber => throw _privateConstructorUsedError;
  num get type => throw _privateConstructorUsedError;
  int? get color => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemoteDayCopyWith<RemoteDay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteDayCopyWith<$Res> {
  factory $RemoteDayCopyWith(RemoteDay value, $Res Function(RemoteDay) then) =
      _$RemoteDayCopyWithImpl<$Res, RemoteDay>;
  @useResult
  $Res call({@JsonKey(name: 'day') num dayNumber, num type, int? color});
}

/// @nodoc
class _$RemoteDayCopyWithImpl<$Res, $Val extends RemoteDay>
    implements $RemoteDayCopyWith<$Res> {
  _$RemoteDayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayNumber = null,
    Object? type = null,
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      dayNumber: null == dayNumber
          ? _value.dayNumber
          : dayNumber // ignore: cast_nullable_to_non_nullable
              as num,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as num,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RemoteDayImplCopyWith<$Res>
    implements $RemoteDayCopyWith<$Res> {
  factory _$$RemoteDayImplCopyWith(
          _$RemoteDayImpl value, $Res Function(_$RemoteDayImpl) then) =
      __$$RemoteDayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'day') num dayNumber, num type, int? color});
}

/// @nodoc
class __$$RemoteDayImplCopyWithImpl<$Res>
    extends _$RemoteDayCopyWithImpl<$Res, _$RemoteDayImpl>
    implements _$$RemoteDayImplCopyWith<$Res> {
  __$$RemoteDayImplCopyWithImpl(
      _$RemoteDayImpl _value, $Res Function(_$RemoteDayImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayNumber = null,
    Object? type = null,
    Object? color = freezed,
  }) {
    return _then(_$RemoteDayImpl(
      dayNumber: null == dayNumber
          ? _value.dayNumber
          : dayNumber // ignore: cast_nullable_to_non_nullable
              as num,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as num,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RemoteDayImpl implements _RemoteDay {
  const _$RemoteDayImpl(
      {@JsonKey(name: 'day') required this.dayNumber,
      required this.type,
      this.color});

  factory _$RemoteDayImpl.fromJson(Map<String, dynamic> json) =>
      _$$RemoteDayImplFromJson(json);

  @override
  @JsonKey(name: 'day')
  final num dayNumber;
  @override
  final num type;
  @override
  final int? color;

  @override
  String toString() {
    return 'RemoteDay(dayNumber: $dayNumber, type: $type, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteDayImpl &&
            (identical(other.dayNumber, dayNumber) ||
                other.dayNumber == dayNumber) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dayNumber, type, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoteDayImplCopyWith<_$RemoteDayImpl> get copyWith =>
      __$$RemoteDayImplCopyWithImpl<_$RemoteDayImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RemoteDayImplToJson(
      this,
    );
  }
}

abstract class _RemoteDay implements RemoteDay {
  const factory _RemoteDay(
      {@JsonKey(name: 'day') required final num dayNumber,
      required final num type,
      final int? color}) = _$RemoteDayImpl;

  factory _RemoteDay.fromJson(Map<String, dynamic> json) =
      _$RemoteDayImpl.fromJson;

  @override
  @JsonKey(name: 'day')
  num get dayNumber;
  @override
  num get type;
  @override
  int? get color;
  @override
  @JsonKey(ignore: true)
  _$$RemoteDayImplCopyWith<_$RemoteDayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
