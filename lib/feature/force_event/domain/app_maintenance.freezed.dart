// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_maintenance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppMaintenance {
  bool get inMaintenance => throw _privateConstructorUsedError;
  String get scheduledEndTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppMaintenanceCopyWith<AppMaintenance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppMaintenanceCopyWith<$Res> {
  factory $AppMaintenanceCopyWith(
          AppMaintenance value, $Res Function(AppMaintenance) then) =
      _$AppMaintenanceCopyWithImpl<$Res, AppMaintenance>;
  @useResult
  $Res call({bool inMaintenance, String scheduledEndTime});
}

/// @nodoc
class _$AppMaintenanceCopyWithImpl<$Res, $Val extends AppMaintenance>
    implements $AppMaintenanceCopyWith<$Res> {
  _$AppMaintenanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inMaintenance = null,
    Object? scheduledEndTime = null,
  }) {
    return _then(_value.copyWith(
      inMaintenance: null == inMaintenance
          ? _value.inMaintenance
          : inMaintenance // ignore: cast_nullable_to_non_nullable
              as bool,
      scheduledEndTime: null == scheduledEndTime
          ? _value.scheduledEndTime
          : scheduledEndTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppMaintenanceImplCopyWith<$Res>
    implements $AppMaintenanceCopyWith<$Res> {
  factory _$$AppMaintenanceImplCopyWith(_$AppMaintenanceImpl value,
          $Res Function(_$AppMaintenanceImpl) then) =
      __$$AppMaintenanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool inMaintenance, String scheduledEndTime});
}

/// @nodoc
class __$$AppMaintenanceImplCopyWithImpl<$Res>
    extends _$AppMaintenanceCopyWithImpl<$Res, _$AppMaintenanceImpl>
    implements _$$AppMaintenanceImplCopyWith<$Res> {
  __$$AppMaintenanceImplCopyWithImpl(
      _$AppMaintenanceImpl _value, $Res Function(_$AppMaintenanceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inMaintenance = null,
    Object? scheduledEndTime = null,
  }) {
    return _then(_$AppMaintenanceImpl(
      inMaintenance: null == inMaintenance
          ? _value.inMaintenance
          : inMaintenance // ignore: cast_nullable_to_non_nullable
              as bool,
      scheduledEndTime: null == scheduledEndTime
          ? _value.scheduledEndTime
          : scheduledEndTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AppMaintenanceImpl implements _AppMaintenance {
  const _$AppMaintenanceImpl(
      {required this.inMaintenance, required this.scheduledEndTime});

  @override
  final bool inMaintenance;
  @override
  final String scheduledEndTime;

  @override
  String toString() {
    return 'AppMaintenance(inMaintenance: $inMaintenance, scheduledEndTime: $scheduledEndTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppMaintenanceImpl &&
            (identical(other.inMaintenance, inMaintenance) ||
                other.inMaintenance == inMaintenance) &&
            (identical(other.scheduledEndTime, scheduledEndTime) ||
                other.scheduledEndTime == scheduledEndTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, inMaintenance, scheduledEndTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppMaintenanceImplCopyWith<_$AppMaintenanceImpl> get copyWith =>
      __$$AppMaintenanceImplCopyWithImpl<_$AppMaintenanceImpl>(
          this, _$identity);
}

abstract class _AppMaintenance implements AppMaintenance {
  const factory _AppMaintenance(
      {required final bool inMaintenance,
      required final String scheduledEndTime}) = _$AppMaintenanceImpl;

  @override
  bool get inMaintenance;
  @override
  String get scheduledEndTime;
  @override
  @JsonKey(ignore: true)
  _$$AppMaintenanceImplCopyWith<_$AppMaintenanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
