import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReportsRecord extends FirestoreRecord {
  ReportsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Headline" field.
  String? _headline;
  String get headline => _headline ?? '';
  bool hasHeadline() => _headline != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "Bank" field.
  String? _bank;
  String get bank => _bank ?? '';
  bool hasBank() => _bank != null;

  // "District" field.
  String? _district;
  String get district => _district ?? '';
  bool hasDistrict() => _district != null;

  // "Image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "UserID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  // "Status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "DateandTime" field.
  DateTime? _dateandTime;
  DateTime? get dateandTime => _dateandTime;
  bool hasDateandTime() => _dateandTime != null;

  void _initializeFields() {
    _headline = snapshotData['Headline'] as String?;
    _description = snapshotData['Description'] as String?;
    _bank = snapshotData['Bank'] as String?;
    _district = snapshotData['District'] as String?;
    _image = snapshotData['Image'] as String?;
    _userID = snapshotData['UserID'] as String?;
    _status = snapshotData['Status'] as String?;
    _dateandTime = snapshotData['DateandTime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Reports');

  static Stream<ReportsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReportsRecord.fromSnapshot(s));

  static Future<ReportsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReportsRecord.fromSnapshot(s));

  static ReportsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReportsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReportsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReportsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReportsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReportsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReportsRecordData({
  String? headline,
  String? description,
  String? bank,
  String? district,
  String? image,
  String? userID,
  String? status,
  DateTime? dateandTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Headline': headline,
      'Description': description,
      'Bank': bank,
      'District': district,
      'Image': image,
      'UserID': userID,
      'Status': status,
      'DateandTime': dateandTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReportsRecordDocumentEquality implements Equality<ReportsRecord> {
  const ReportsRecordDocumentEquality();

  @override
  bool equals(ReportsRecord? e1, ReportsRecord? e2) {
    return e1?.headline == e2?.headline &&
        e1?.description == e2?.description &&
        e1?.bank == e2?.bank &&
        e1?.district == e2?.district &&
        e1?.image == e2?.image &&
        e1?.userID == e2?.userID &&
        e1?.status == e2?.status &&
        e1?.dateandTime == e2?.dateandTime;
  }

  @override
  int hash(ReportsRecord? e) => const ListEquality().hash([
        e?.headline,
        e?.description,
        e?.bank,
        e?.district,
        e?.image,
        e?.userID,
        e?.status,
        e?.dateandTime
      ]);

  @override
  bool isValidKey(Object? o) => o is ReportsRecord;
}
