import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WithdrawalsRecord extends FirestoreRecord {
  WithdrawalsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _amount = castToType<double>(snapshotData['amount']);
    _address = snapshotData['address'] as String?;
    _status = snapshotData['status'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('withdrawals');

  static Stream<WithdrawalsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WithdrawalsRecord.fromSnapshot(s));

  static Future<WithdrawalsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WithdrawalsRecord.fromSnapshot(s));

  static WithdrawalsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WithdrawalsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WithdrawalsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WithdrawalsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WithdrawalsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WithdrawalsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWithdrawalsRecordData({
  DocumentReference? userRef,
  double? amount,
  String? address,
  String? status,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_ref': userRef,
      'amount': amount,
      'address': address,
      'status': status,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class WithdrawalsRecordDocumentEquality implements Equality<WithdrawalsRecord> {
  const WithdrawalsRecordDocumentEquality();

  @override
  bool equals(WithdrawalsRecord? e1, WithdrawalsRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.amount == e2?.amount &&
        e1?.address == e2?.address &&
        e1?.status == e2?.status &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(WithdrawalsRecord? e) => const ListEquality()
      .hash([e?.userRef, e?.amount, e?.address, e?.status, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is WithdrawalsRecord;
}
