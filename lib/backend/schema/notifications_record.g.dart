// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NotificationsRecord> _$notificationsRecordSerializer =
new _$NotificationsRecordSerializer();

class _$NotificationsRecordSerializer
    implements StructuredSerializer<NotificationsRecord> {
  @override
  final Iterable<Type> types = const [
    NotificationsRecord,
    _$NotificationsRecord
  ];
  @override
  final String wireName = 'NotificationsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NotificationsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.conversationId;
    if (value != null) {
      result
        ..add('conversation_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postId;
    if (value != null) {
      result
        ..add('post_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.users;
    if (value != null) {
      result
        ..add('users')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(UsersStruct)])));
    }
    value = object.postData;
    if (value != null) {
      result
        ..add('postData')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.usersId;
    if (value != null) {
      result
        ..add('users_id')
        ..add(serializers.serialize(value,
            specifiedType:
            const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.userProfile;
    if (value != null) {
      result
        ..add('user_profile')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userRef;
    if (value != null) {
      result
        ..add('user_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  NotificationsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NotificationsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'conversation_id':
          result.conversationId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'post_id':
          result.postId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'users':
          result.users.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(UsersStruct)]))!
          as BuiltList<Object?>);
          break;
        case 'postData':
          result.postData = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'users_id':
          result.usersId.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(String)]))!
          as BuiltList<Object?>);
          break;
        case 'user_profile':
          result.userProfile = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_ref':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$NotificationsRecord extends NotificationsRecord {
  @override
  final String? conversationId;
  @override
  final DateTime? createdAt;
  @override
  final String? message;
  @override
  final String? postId;
  @override
  final String? title;
  @override
  final BuiltList<UsersStruct>? users;
  @override
  final DocumentReference<Object?>? postData;
  @override
  final BuiltList<String>? usersId;
  @override
  final String? userProfile;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$NotificationsRecord(
      [void Function(NotificationsRecordBuilder)? updates]) =>
      (new NotificationsRecordBuilder()..update(updates))._build();

  _$NotificationsRecord._(
      {this.conversationId,
        this.createdAt,
        this.message,
        this.postId,
        this.title,
        this.users,
        this.postData,
        this.usersId,
        this.userProfile,
        this.userRef,
        this.ffRef})
      : super._();

  @override
  NotificationsRecord rebuild(
      void Function(NotificationsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationsRecordBuilder toBuilder() =>
      new NotificationsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationsRecord &&
        conversationId == other.conversationId &&
        createdAt == other.createdAt &&
        message == other.message &&
        postId == other.postId &&
        title == other.title &&
        users == other.users &&
        postData == other.postData &&
        usersId == other.usersId &&
        userProfile == other.userProfile &&
        userRef == other.userRef &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, conversationId.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, postId.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, users.hashCode);
    _$hash = $jc(_$hash, postData.hashCode);
    _$hash = $jc(_$hash, usersId.hashCode);
    _$hash = $jc(_$hash, userProfile.hashCode);
    _$hash = $jc(_$hash, userRef.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotificationsRecord')
      ..add('conversationId', conversationId)
      ..add('createdAt', createdAt)
      ..add('message', message)
      ..add('postId', postId)
      ..add('title', title)
      ..add('users', users)
      ..add('postData', postData)
      ..add('usersId', usersId)
      ..add('userProfile', userProfile)
      ..add('userRef', userRef)
      ..add('ffRef', ffRef))
        .toString();
  }
}

class NotificationsRecordBuilder
    implements Builder<NotificationsRecord, NotificationsRecordBuilder> {
  _$NotificationsRecord? _$v;

  String? _conversationId;
  String? get conversationId => _$this._conversationId;
  set conversationId(String? conversationId) =>
      _$this._conversationId = conversationId;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _postId;
  String? get postId => _$this._postId;
  set postId(String? postId) => _$this._postId = postId;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  ListBuilder<UsersStruct>? _users;
  ListBuilder<UsersStruct> get users =>
      _$this._users ??= new ListBuilder<UsersStruct>();
  set users(ListBuilder<UsersStruct>? users) => _$this._users = users;

  DocumentReference<Object?>? _postData;
  DocumentReference<Object?>? get postData => _$this._postData;
  set postData(DocumentReference<Object?>? postData) =>
      _$this._postData = postData;

  ListBuilder<String>? _usersId;
  ListBuilder<String> get usersId =>
      _$this._usersId ??= new ListBuilder<String>();
  set usersId(ListBuilder<String>? usersId) => _$this._usersId = usersId;

  String? _userProfile;
  String? get userProfile => _$this._userProfile;
  set userProfile(String? userProfile) => _$this._userProfile = userProfile;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  NotificationsRecordBuilder() {
    NotificationsRecord._initializeBuilder(this);
  }

  NotificationsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _conversationId = $v.conversationId;
      _createdAt = $v.createdAt;
      _message = $v.message;
      _postId = $v.postId;
      _title = $v.title;
      _users = $v.users?.toBuilder();
      _postData = $v.postData;
      _usersId = $v.usersId?.toBuilder();
      _userProfile = $v.userProfile;
      _userRef = $v.userRef;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotificationsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationsRecord;
  }

  @override
  void update(void Function(NotificationsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationsRecord build() => _build();

  _$NotificationsRecord _build() {
    _$NotificationsRecord _$result;
    try {
      _$result = _$v ??
          new _$NotificationsRecord._(
              conversationId: conversationId,
              createdAt: createdAt,
              message: message,
              postId: postId,
              title: title,
              users: _users?.build(),
              postData: postData,
              usersId: _usersId?.build(),
              userProfile: userProfile,
              userRef: userRef,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'users';
        _users?.build();

        _$failedField = 'usersId';
        _usersId?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'NotificationsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
