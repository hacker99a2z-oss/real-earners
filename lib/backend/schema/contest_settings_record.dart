import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContestSettingsRecord extends FirestoreRecord {
  ContestSettingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "current_week" field.
  String? _currentWeek;
  String get currentWeek => _currentWeek ?? '';
  bool hasCurrentWeek() => _currentWeek != null;

  // "is_processed" field.
  bool? _isProcessed;
  bool get isProcessed => _isProcessed ?? false;
  bool hasIsProcessed() => _isProcessed != null;

  // "last_processed_week" field.
  String? _lastProcessedWeek;
  String get lastProcessedWeek => _lastProcessedWeek ?? '';
  bool hasLastProcessedWeek() => _lastProcessedWeek != null;

  void _initializeFields() {
    _currentWeek = snapshotData['current_week'] as String?;
    _isProcessed = snapshotData['is_processed'] as bool?;
    _lastProcessedWeek = snapshotData['last_processed_week'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('contest_settings');

  static Stream<ContestSettingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContestSettingsRecord.fromSnapshot(s));

  static Future<ContestSettingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ContestSettingsRecord.fromSnapshot(s));

  static ContestSettingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContestSettingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContestSettingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContestSettingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContestSettingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContestSettingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContestSettingsRecordData({
  String? currentWeek,
  bool? isProcessed,
  String? lastProcessedWeek,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'current_week': currentWeek,
      'is_processed': isProcessed,
      'last_processed_week': lastProcessedWeek,
    }.withoutNulls,
  );

  return firestoreData;
}

class ContestSettingsRecordDocumentEquality
    implements Equality<ContestSettingsRecord> {
  const ContestSettingsRecordDocumentEquality();

  @override
  bool equals(ContestSettingsRecord? e1, ContestSettingsRecord? e2) {
    return e1?.currentWeek == e2?.currentWeek &&
        e1?.isProcessed == e2?.isProcessed &&
        e1?.lastProcessedWeek == e2?.lastProcessedWeek;
  }

  @override
  int hash(ContestSettingsRecord? e) => const ListEquality()
      .hash([e?.currentWeek, e?.isProcessed, e?.lastProcessedWeek]);

  @override
  bool isValidKey(Object? o) => o is ContestSettingsRecord;
}
