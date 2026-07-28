import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContestsRecord extends FirestoreRecord {
  ContestsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "contest_id" field.
  String? _contestId;
  String get contestId => _contestId ?? '';
  bool hasContestId() => _contestId != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "score" field.
  int? _score;
  int get score => _score ?? 0;
  bool hasScore() => _score != null;

  // "joined_at" field.
  DateTime? _joinedAt;
  DateTime? get joinedAt => _joinedAt;
  bool hasJoinedAt() => _joinedAt != null;

  // "end_time" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "week_number" field.
  int? _weekNumber;
  int get weekNumber => _weekNumber ?? 0;
  bool hasWeekNumber() => _weekNumber != null;

  void _initializeFields() {
    _contestId = snapshotData['contest_id'] as String?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _score = castToType<int>(snapshotData['score']);
    _joinedAt = snapshotData['joined_at'] as DateTime?;
    _endTime = snapshotData['end_time'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _weekNumber = castToType<int>(snapshotData['week_number']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('contests');

  static Stream<ContestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContestsRecord.fromSnapshot(s));

  static Future<ContestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ContestsRecord.fromSnapshot(s));

  static ContestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContestsRecordData({
  String? contestId,
  DocumentReference? userRef,
  int? score,
  DateTime? joinedAt,
  DateTime? endTime,
  String? status,
  int? weekNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'contest_id': contestId,
      'user_ref': userRef,
      'score': score,
      'joined_at': joinedAt,
      'end_time': endTime,
      'status': status,
      'week_number': weekNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class ContestsRecordDocumentEquality implements Equality<ContestsRecord> {
  const ContestsRecordDocumentEquality();

  @override
  bool equals(ContestsRecord? e1, ContestsRecord? e2) {
    return e1?.contestId == e2?.contestId &&
        e1?.userRef == e2?.userRef &&
        e1?.score == e2?.score &&
        e1?.joinedAt == e2?.joinedAt &&
        e1?.endTime == e2?.endTime &&
        e1?.status == e2?.status &&
        e1?.weekNumber == e2?.weekNumber;
  }

  @override
  int hash(ContestsRecord? e) => const ListEquality().hash([
        e?.contestId,
        e?.userRef,
        e?.score,
        e?.joinedAt,
        e?.endTime,
        e?.status,
        e?.weekNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is ContestsRecord;
}
