import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_config_document.freezed.dart';

@freezed
class AppConfigDocument with _$AppConfigDocument {
  const factory AppConfigDocument({
    required String minAppVersionForIos,
    required String minAppVersionForAndroid,
    required bool inMaintenance,
  }) = _AppConfigDocument;

  factory AppConfigDocument.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;

    return AppConfigDocument(
      minAppVersionForIos: data[minAppVersionForIosField] as String,
      minAppVersionForAndroid: data[minAppVersionForAndroidField] as String,
      inMaintenance: data[inMaintenanceField] as bool,
    );
  }
  const AppConfigDocument._();

  static const collectionName = 'app_config';

  // * Field Name.
  static const minAppVersionForIosField = 'minRequiredAppVersionIos';
  static const minAppVersionForAndroidField = 'minRequiredAppVersionAndroid';
  static const inMaintenanceField = 'inMaintenance';
}
