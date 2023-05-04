import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'notifications_record.g.dart';

abstract class NotificationsRecord
    implements Built<NotificationsRecord, NotificationsRecordBuilder> {
  static Serializer<NotificationsRecord> get serializer =>
      _$notificationsRecordSerializer;

  @BuiltValueField(wireName: 'conversation_id')
  String? get conversationId;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  String? get message;

  @BuiltValueField(wireName: 'post_id')
  String? get postId;

  String? get title;

  BuiltList<UsersStruct>? get users;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(NotificationsRecordBuilder builder) => builder
    ..conversationId = ''
    ..message = ''
    ..postId = ''
    ..title = ''
    ..users = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  NotificationsRecord._();
  factory NotificationsRecord(
          [void Function(NotificationsRecordBuilder) updates]) =
      _$NotificationsRecord;

  static NotificationsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createNotificationsRecordData({
  String? conversationId,
  DateTime? createdAt,
  String? message,
  String? postId,
  String? title,
}) {
  final firestoreData = serializers.toFirestore(
    NotificationsRecord.serializer,
    NotificationsRecord(
      (n) => n
        ..conversationId = conversationId
        ..createdAt = createdAt
        ..message = message
        ..postId = postId
        ..title = title
        ..users = null,
    ),
  );

  return firestoreData;
}
