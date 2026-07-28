import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "coins" field.
  int? _coins;
  int get coins => _coins ?? 0;
  bool hasCoins() => _coins != null;

  // "referred_by" field.
  DocumentReference? _referredBy;
  DocumentReference? get referredBy => _referredBy;
  bool hasReferredBy() => _referredBy != null;

  // "ads_watched_count" field.
  int? _adsWatchedCount;
  int get adsWatchedCount => _adsWatchedCount ?? 0;
  bool hasAdsWatchedCount() => _adsWatchedCount != null;

  // "wallet_balance" field.
  double? _walletBalance;
  double get walletBalance => _walletBalance ?? 0.0;
  bool hasWalletBalance() => _walletBalance != null;

  // "referral_code" field.
  String? _referralCode;
  String get referralCode => _referralCode ?? '';
  bool hasReferralCode() => _referralCode != null;

  // "weekly_coins" field.
  int? _weeklyCoins;
  int get weeklyCoins => _weeklyCoins ?? 0;
  bool hasWeeklyCoins() => _weeklyCoins != null;

  // "last_active_week" field.
  String? _lastActiveWeek;
  String get lastActiveWeek => _lastActiveWeek ?? '';
  bool hasLastActiveWeek() => _lastActiveWeek != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _coins = castToType<int>(snapshotData['coins']);
    _referredBy = snapshotData['referred_by'] as DocumentReference?;
    _adsWatchedCount = castToType<int>(snapshotData['ads_watched_count']);
    _walletBalance = castToType<double>(snapshotData['wallet_balance']);
    _referralCode = snapshotData['referral_code'] as String?;
    _weeklyCoins = castToType<int>(snapshotData['weekly_coins']);
    _lastActiveWeek = snapshotData['last_active_week'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  int? coins,
  DocumentReference? referredBy,
  int? adsWatchedCount,
  double? walletBalance,
  String? referralCode,
  int? weeklyCoins,
  String? lastActiveWeek,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'coins': coins,
      'referred_by': referredBy,
      'ads_watched_count': adsWatchedCount,
      'wallet_balance': walletBalance,
      'referral_code': referralCode,
      'weekly_coins': weeklyCoins,
      'last_active_week': lastActiveWeek,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.coins == e2?.coins &&
        e1?.referredBy == e2?.referredBy &&
        e1?.adsWatchedCount == e2?.adsWatchedCount &&
        e1?.walletBalance == e2?.walletBalance &&
        e1?.referralCode == e2?.referralCode &&
        e1?.weeklyCoins == e2?.weeklyCoins &&
        e1?.lastActiveWeek == e2?.lastActiveWeek;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.coins,
        e?.referredBy,
        e?.adsWatchedCount,
        e?.walletBalance,
        e?.referralCode,
        e?.weeklyCoins,
        e?.lastActiveWeek
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
