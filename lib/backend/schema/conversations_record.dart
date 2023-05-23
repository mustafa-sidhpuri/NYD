import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConversationsRecord extends FirestoreRecord {
  ConversationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "product_id" field.
  String? _productId;
  String get productId => _productId ?? '';
  bool hasProductId() => _productId != null;

  // "product_name" field.
  String? _productName;
  String get productName => _productName ?? '';
  bool hasProductName() => _productName != null;

  // "product_image" field.
  String? _productImage;
  String get productImage => _productImage ?? '';
  bool hasProductImage() => _productImage != null;

  // "last_message" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "chats" field.
  DocumentReference? _chats;
  DocumentReference? get chats => _chats;
  bool hasChats() => _chats != null;

  // "last_message_at" field.
  int? _lastMessageAt;
  int get lastMessageAt => _lastMessageAt ?? 0;
  bool hasLastMessageAt() => _lastMessageAt != null;

  // "last_message_by" field.
  String? _lastMessageBy;
  String get lastMessageBy => _lastMessageBy ?? '';
  bool hasLastMessageBy() => _lastMessageBy != null;

  // "user_details" field.
  List<UserStruct>? _userDetails;
  List<UserStruct> get userDetails => _userDetails ?? const [];
  bool hasUserDetails() => _userDetails != null;

  // "users" field.
  List<String>? _users;
  List<String> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "posted_by_refrence" field.
  DocumentReference? _postedByRefrence;
  DocumentReference? get postedByRefrence => _postedByRefrence;
  bool hasPostedByRefrence() => _postedByRefrence != null;

  // "posted_by_location" field.
  String? _postedByLocation;
  String get postedByLocation => _postedByLocation ?? '';
  bool hasPostedByLocation() => _postedByLocation != null;

  // "create_user_refrence" field.
  DocumentReference? _createUserRefrence;
  DocumentReference? get createUserRefrence => _createUserRefrence;
  bool hasCreateUserRefrence() => _createUserRefrence != null;

  void _initializeFields() {
    _productId = snapshotData['product_id'] as String?;
    _productName = snapshotData['product_name'] as String?;
    _productImage = snapshotData['product_image'] as String?;
    _lastMessage = snapshotData['last_message'] as String?;
    _chats = snapshotData['chats'] as DocumentReference?;
    _lastMessageAt = snapshotData['last_message_at'] as int?;
    _lastMessageBy = snapshotData['last_message_by'] as String?;
    _userDetails = getStructList(
      snapshotData['user_details'],
      UserStruct.fromMap,
    );
    _users = getDataList(snapshotData['users']);
    _postedByRefrence =
        snapshotData['posted_by_refrence'] as DocumentReference?;
    _postedByLocation = snapshotData['posted_by_location'] as String?;
    _createUserRefrence =
        snapshotData['create_user_refrence'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('conversations');

  static Stream<ConversationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConversationsRecord.fromSnapshot(s));

  static Future<ConversationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConversationsRecord.fromSnapshot(s));

  static ConversationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConversationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConversationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConversationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConversationsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createConversationsRecordData({
  String? productId,
  String? productName,
  String? productImage,
  String? lastMessage,
  DocumentReference? chats,
  int? lastMessageAt,
  String? lastMessageBy,
  DocumentReference? postedByRefrence,
  String? postedByLocation,
  DocumentReference? createUserRefrence,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'product_id': productId,
      'product_name': productName,
      'product_image': productImage,
      'last_message': lastMessage,
      'chats': chats,
      'last_message_at': lastMessageAt,
      'last_message_by': lastMessageBy,
      'posted_by_refrence': postedByRefrence,
      'posted_by_location': postedByLocation,
      'create_user_refrence': createUserRefrence,
    }.withoutNulls,
  );

  return firestoreData;
}
