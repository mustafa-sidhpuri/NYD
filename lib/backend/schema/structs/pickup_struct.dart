// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PickupStruct extends FFFirebaseStruct {
  PickupStruct({
    String? userId,
    String? userName,
    String? userImage,
    DateTime? pickupTime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userId = userId,
        _userName = userName,
        _userImage = userImage,
        _pickupTime = pickupTime,
        super(firestoreUtilData);

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;
  bool hasUserId() => _userId != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;
  bool hasUserName() => _userName != null;

  // "user_image" field.
  String? _userImage;
  String get userImage => _userImage ?? '';
  set userImage(String? val) => _userImage = val;
  bool hasUserImage() => _userImage != null;

  // "pickup_time" field.
  DateTime? _pickupTime;
  DateTime? get pickupTime => _pickupTime;
  set pickupTime(DateTime? val) => _pickupTime = val;
  bool hasPickupTime() => _pickupTime != null;

  static PickupStruct fromMap(Map<String, dynamic> data) => PickupStruct(
        userId: data['user_id'] as String?,
        userName: data['user_name'] as String?,
        userImage: data['user_image'] as String?,
        pickupTime: data['pickup_time'] as DateTime?,
      );

  static PickupStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PickupStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'user_id': _userId,
        'user_name': _userName,
        'user_image': _userImage,
        'pickup_time': _pickupTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => toMap();
  static PickupStruct fromSerializableMap(Map<String, dynamic> data) =>
      fromMap(data);

  @override
  String toString() => 'PickupStruct(${toMap()})';
}

PickupStruct createPickupStruct({
  String? userId,
  String? userName,
  String? userImage,
  DateTime? pickupTime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PickupStruct(
      userId: userId,
      userName: userName,
      userImage: userImage,
      pickupTime: pickupTime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PickupStruct? updatePickupStruct(
  PickupStruct? pickup, {
  bool clearUnsetFields = true,
}) =>
    pickup
      ?..firestoreUtilData =
          FirestoreUtilData(clearUnsetFields: clearUnsetFields);

void addPickupStructData(
  Map<String, dynamic> firestoreData,
  PickupStruct? pickup,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (pickup == null) {
    return;
  }
  if (pickup.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && pickup.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pickupData = getPickupFirestoreData(pickup, forFieldValue);
  final nestedData = pickupData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = pickup.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPickupFirestoreData(
  PickupStruct? pickup, [
  bool forFieldValue = false,
]) {
  if (pickup == null) {
    return {};
  }
  final firestoreData = mapToFirestore(pickup.toMap());

  // Add any Firestore field values
  pickup.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPickupListFirestoreData(
  List<PickupStruct>? pickups,
) =>
    pickups?.map((e) => getPickupFirestoreData(e, true)).toList() ?? [];
