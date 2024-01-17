import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdhaarAuthenticationRecord extends FirestoreRecord {
  AdhaarAuthenticationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "AdhaarNo" field.
  String? _adhaarNo;
  String get adhaarNo => _adhaarNo ?? '';
  bool hasAdhaarNo() => _adhaarNo != null;

  // "AdhaarOTP" field.
  String? _adhaarOTP;
  String get adhaarOTP => _adhaarOTP ?? '';
  bool hasAdhaarOTP() => _adhaarOTP != null;

  void _initializeFields() {
    _adhaarNo = snapshotData['AdhaarNo'] as String?;
    _adhaarOTP = snapshotData['AdhaarOTP'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('AdhaarAuthentication');

  static Stream<AdhaarAuthenticationRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => AdhaarAuthenticationRecord.fromSnapshot(s));

  static Future<AdhaarAuthenticationRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AdhaarAuthenticationRecord.fromSnapshot(s));

  static AdhaarAuthenticationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdhaarAuthenticationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdhaarAuthenticationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdhaarAuthenticationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdhaarAuthenticationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdhaarAuthenticationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdhaarAuthenticationRecordData({
  String? adhaarNo,
  String? adhaarOTP,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'AdhaarNo': adhaarNo,
      'AdhaarOTP': adhaarOTP,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdhaarAuthenticationRecordDocumentEquality
    implements Equality<AdhaarAuthenticationRecord> {
  const AdhaarAuthenticationRecordDocumentEquality();

  @override
  bool equals(AdhaarAuthenticationRecord? e1, AdhaarAuthenticationRecord? e2) {
    return e1?.adhaarNo == e2?.adhaarNo && e1?.adhaarOTP == e2?.adhaarOTP;
  }

  @override
  int hash(AdhaarAuthenticationRecord? e) =>
      const ListEquality().hash([e?.adhaarNo, e?.adhaarOTP]);

  @override
  bool isValidKey(Object? o) => o is AdhaarAuthenticationRecord;
}
