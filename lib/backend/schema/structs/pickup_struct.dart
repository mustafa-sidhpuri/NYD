import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'pickup_struct.g.dart';

abstract class PickupStruct
    implements Built<PickupStruct, PickupStructBuilder> {
  static Serializer<PickupStruct> get serializer => _$pickupStructSerializer;

  @BuiltValueField(wireName: 'user_id')
  String? get userId;

  @BuiltValueField(wireName: 'user_name')
  String? get userName;

  @BuiltValueField(wireName: 'user_image')
  String? get userImage;

  @BuiltValueField(wireName: 'pickup_time')
  DateTime? get pickupTime;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(PickupStructBuilder builder) => builder
    ..userId = ''
    ..userName = ''
    ..userImage = ''
    ..firestoreUtilData = FirestoreUtilData();

  PickupStruct._();
  factory PickupStruct([void Function(PickupStructBuilder) updates]) =
      _$PickupStruct;
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
      (p) => p
        ..userId = userId
        ..userName = userName
        ..userImage = userImage
        ..pickupTime = pickupTime
        ..firestoreUtilData = FirestoreUtilData(
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
    pickup != null
        ? (pickup.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

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

  return;
}

Map<String, dynamic> getPickupFirestoreData(
  PickupStruct? pickup, [
  bool forFieldValue = false,
]) {
  if (pickup == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(PickupStruct.serializer, pickup);

  // Add any Firestore field values
  pickup.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPickupListFirestoreData(
  List<PickupStruct>? pickups,
) =>
    pickups?.map((p) => getPickupFirestoreData(p, true)).toList() ?? [];
