import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "conversation_id" field.
  String? _conversationId;
  String get conversationId => _conversationId ?? '';
  bool hasConversationId() => _conversationId != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "post_id" field.
  String? _postId;
  String get postId => _postId ?? '';
  bool hasPostId() => _postId != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "users" field.
  List<UsersStruct>? _users;
  List<UsersStruct> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "postData" field.
  DocumentReference? _postData;
  DocumentReference? get postData => _postData;
  bool hasPostData() => _postData != null;

  // "users_id" field.
  List<String>? _usersId;
  List<String> get usersId => _usersId ?? const [];
  bool hasUsersId() => _usersId != null;

  // "user_profile" field.
  String? _userProfile;
  String get userProfile => _userProfile ?? '';
  bool hasUserProfile() => _userProfile != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _conversationId = snapshotData['conversation_id'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _message = snapshotData['message'] as String?;
    _postId = snapshotData['post_id'] as String?;
    _title = snapshotData['title'] as String?;
    _users = getStructList(
      snapshotData['users'],
      UsersStruct.fromMap,
    );
    _postData = snapshotData['postData'] as DocumentReference?;
    _usersId = getDataList(snapshotData['users_id']);
    _userProfile = snapshotData['user_profile'] as String?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createNotificationsRecordData({
  String? conversationId,
  DateTime? createdAt,
  String? message,
  String? postId,
  String? title,
  DocumentReference? postData,
  String? userProfile,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'conversation_id': conversationId,
      'created_at': createdAt,
      'message': message,
      'post_id': postId,
      'title': title,
      'postData': postData,
      'user_profile': userProfile,
      'user_ref': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}
