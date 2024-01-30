// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_config_document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppConfigDocument {
  String get minAppVersionForIos => throw _privateConstructorUsedError;
  String get minAppVersionForAndroid => throw _privateConstructorUsedError;
  bool get inMaintenance => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppConfigDocumentCopyWith<AppConfigDocument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppConfigDocumentCopyWith<$Res> {
  factory $AppConfigDocumentCopyWith(
          AppConfigDocument value, $Res Function(AppConfigDocument) then) =
      _$AppConfigDocumentCopyWithImpl<$Res, AppConfigDocument>;
  @useResult
  $Res call(
      {String minAppVersionForIos,
      String minAppVersionForAndroid,
      bool inMaintenance});
}

/// @nodoc
class _$AppConfigDocumentCopyWithImpl<$Res, $Val extends AppConfigDocument>
    implements $AppConfigDocumentCopyWith<$Res> {
  _$AppConfigDocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minAppVersionForIos = null,
    Object? minAppVersionForAndroid = null,
    Object? inMaintenance = null,
  }) {
    return _then(_value.copyWith(
      minAppVersionForIos: null == minAppVersionForIos
          ? _value.minAppVersionForIos
          : minAppVersionForIos // ignore: cast_nullable_to_non_nullable
              as String,
      minAppVersionForAndroid: null == minAppVersionForAndroid
          ? _value.minAppVersionForAndroid
          : minAppVersionForAndroid // ignore: cast_nullable_to_non_nullable
              as String,
      inMaintenance: null == inMaintenance
          ? _value.inMaintenance
          : inMaintenance // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppConfigDocumentImplCopyWith<$Res>
    implements $AppConfigDocumentCopyWith<$Res> {
  factory _$$AppConfigDocumentImplCopyWith(_$AppConfigDocumentImpl value,
          $Res Function(_$AppConfigDocumentImpl) then) =
      __$$AppConfigDocumentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String minAppVersionForIos,
      String minAppVersionForAndroid,
      bool inMaintenance});
}

/// @nodoc
class __$$AppConfigDocumentImplCopyWithImpl<$Res>
    extends _$AppConfigDocumentCopyWithImpl<$Res, _$AppConfigDocumentImpl>
    implements _$$AppConfigDocumentImplCopyWith<$Res> {
  __$$AppConfigDocumentImplCopyWithImpl(_$AppConfigDocumentImpl _value,
      $Res Function(_$AppConfigDocumentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minAppVersionForIos = null,
    Object? minAppVersionForAndroid = null,
    Object? inMaintenance = null,
  }) {
    return _then(_$AppConfigDocumentImpl(
      minAppVersionForIos: null == minAppVersionForIos
          ? _value.minAppVersionForIos
          : minAppVersionForIos // ignore: cast_nullable_to_non_nullable
              as String,
      minAppVersionForAndroid: null == minAppVersionForAndroid
          ? _value.minAppVersionForAndroid
          : minAppVersionForAndroid // ignore: cast_nullable_to_non_nullable
              as String,
      inMaintenance: null == inMaintenance
          ? _value.inMaintenance
          : inMaintenance // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AppConfigDocumentImpl extends _AppConfigDocument {
  const _$AppConfigDocumentImpl(
      {required this.minAppVersionForIos,
      required this.minAppVersionForAndroid,
      required this.inMaintenance})
      : super._();

  @override
  final String minAppVersionForIos;
  @override
  final String minAppVersionForAndroid;
  @override
  final bool inMaintenance;

  @override
  String toString() {
    return 'AppConfigDocument(minAppVersionForIos: $minAppVersionForIos, minAppVersionForAndroid: $minAppVersionForAndroid, inMaintenance: $inMaintenance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppConfigDocumentImpl &&
            (identical(other.minAppVersionForIos, minAppVersionForIos) ||
                other.minAppVersionForIos == minAppVersionForIos) &&
            (identical(
                    other.minAppVersionForAndroid, minAppVersionForAndroid) ||
                other.minAppVersionForAndroid == minAppVersionForAndroid) &&
            (identical(other.inMaintenance, inMaintenance) ||
                other.inMaintenance == inMaintenance));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, minAppVersionForIos, minAppVersionForAndroid, inMaintenance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppConfigDocumentImplCopyWith<_$AppConfigDocumentImpl> get copyWith =>
      __$$AppConfigDocumentImplCopyWithImpl<_$AppConfigDocumentImpl>(
          this, _$identity);
}

abstract class _AppConfigDocument extends AppConfigDocument {
  const factory _AppConfigDocument(
      {required final String minAppVersionForIos,
      required final String minAppVersionForAndroid,
      required final bool inMaintenance}) = _$AppConfigDocumentImpl;
  const _AppConfigDocument._() : super._();

  @override
  String get minAppVersionForIos;
  @override
  String get minAppVersionForAndroid;
  @override
  bool get inMaintenance;
  @override
  @JsonKey(ignore: true)
  _$$AppConfigDocumentImplCopyWith<_$AppConfigDocumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
