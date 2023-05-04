import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'conversations_record.g.dart';

abstract class ConversationsRecord
    implements Built<ConversationsRecord, ConversationsRecordBuilder> {
  static Serializer<ConversationsRecord> get serializer =>
      _$conversationsRecordSerializer;

  @BuiltValueField(wireName: 'product_id')
  String? get productId;

  @BuiltValueField(wireName: 'product_name')
  String? get productName;

  @BuiltValueField(wireName: 'product_image')
  String? get productImage;

  @BuiltValueField(wireName: 'last_message')
  String? get lastMessage;

  DocumentReference? get chats;

  @BuiltValueField(wireName: 'last_message_at')
  int? get lastMessageAt;

  @BuiltValueField(wireName: 'last_message_by')
  String? get lastMessageBy;

  @BuiltValueField(wireName: 'user_details')
  BuiltList<UserStruct>? get userDetails;

  BuiltList<String>? get users;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ConversationsRecordBuilder builder) => builder
    ..productId = ''
    ..productName = ''
    ..productImage = ''
    ..lastMessage = ''
    ..lastMessageAt = 0
    ..lastMessageBy = ''
    ..userDetails = ListBuilder()
    ..users = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('conversations');

  static Stream<ConversationsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ConversationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ConversationsRecord._();
  factory ConversationsRecord(
          [void Function(ConversationsRecordBuilder) updates]) =
      _$ConversationsRecord;

  static ConversationsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createConversationsRecordData({
  String? productId,
  String? productName,
  String? productImage,
  String? lastMessage,
  DocumentReference? chats,
  int? lastMessageAt,
  String? lastMessageBy,
}) {
  final firestoreData = serializers.toFirestore(
    ConversationsRecord.serializer,
    ConversationsRecord(
      (c) => c
        ..productId = productId
        ..productName = productName
        ..productImage = productImage
        ..lastMessage = lastMessage
        ..chats = chats
        ..lastMessageAt = lastMessageAt
        ..lastMessageBy = lastMessageBy
        ..userDetails = null
        ..users = null,
    ),
  );

  return firestoreData;
}
