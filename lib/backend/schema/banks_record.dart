import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BanksRecord extends FirestoreRecord {
  BanksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Bank_Name" field.
  String? _bankName;
  String get bankName => _bankName ?? '';
  bool hasBankName() => _bankName != null;

  // "Number" field.
  String? _number;
  String get number => _number ?? '';
  bool hasNumber() => _number != null;

  void _initializeFields() {
    _bankName = snapshotData['Bank_Name'] as String?;
    _number = snapshotData['Number'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Banks');

  static Stream<BanksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BanksRecord.fromSnapshot(s));

  static Future<BanksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BanksRecord.fromSnapshot(s));

  static BanksRecord fromSnapshot(DocumentSnapshot snapshot) => BanksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BanksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BanksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BanksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BanksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBanksRecordData({
  String? bankName,
  String? number,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Bank_Name': bankName,
      'Number': number,
    }.withoutNulls,
  );

  return firestoreData;
}

class BanksRecordDocumentEquality implements Equality<BanksRecord> {
  const BanksRecordDocumentEquality();

  @override
  bool equals(BanksRecord? e1, BanksRecord? e2) {
    return e1?.bankName == e2?.bankName && e1?.number == e2?.number;
  }

  @override
  int hash(BanksRecord? e) =>
      const ListEquality().hash([e?.bankName, e?.number]);

  @override
  bool isValidKey(Object? o) => o is BanksRecord;
}
