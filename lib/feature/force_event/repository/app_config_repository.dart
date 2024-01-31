import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/infrastructure/firebase_instance.dart';
import 'app_config_document.dart';

part 'app_config_repository.g.dart';

@riverpod
AppConfigRepository appConfigRepository(AppConfigRepositoryRef ref) =>
    AppConfigRepository(ref.watch(firestoreProvider));

class AppConfigRepository {
  AppConfigRepository(this.firestore);

  final FirebaseFirestore firestore;

  DocumentReference get _appConfigDocRef => firestore
      .collection(AppConfigDocument.collectionName)
      .doc('app_config_doc');

  Stream<AppConfigDocument> subscribeAppConfig() {
    return _appConfigDocRef.snapshots().map(AppConfigDocument.fromFirestore);
  }
}
