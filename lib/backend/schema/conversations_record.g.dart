// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversations_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ConversationsRecord> _$conversationsRecordSerializer =
    new _$ConversationsRecordSerializer();

class _$ConversationsRecordSerializer
    implements StructuredSerializer<ConversationsRecord> {
  @override
  final Iterable<Type> types = const [
    ConversationsRecord,
    _$ConversationsRecord
  ];
  @override
  final String wireName = 'ConversationsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ConversationsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.productId;
    if (value != null) {
      result
        ..add('product_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.productName;
    if (value != null) {
      result
        ..add('product_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.productImage;
    if (value != null) {
      result
        ..add('product_image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastMessage;
    if (value != null) {
      result
        ..add('last_message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.chats;
    if (value != null) {
      result
        ..add('chats')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.lastMessageAt;
    if (value != null) {
      result
        ..add('last_message_at')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.lastMessageBy;
    if (value != null) {
      result
        ..add('last_message_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userDetails;
    if (value != null) {
      result
        ..add('user_details')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(UserStruct)])));
    }
    value = object.users;
    if (value != null) {
      result
        ..add('users')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
  ConversationsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ConversationsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'product_id':
          result.productId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'product_name':
          result.productName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'product_image':
          result.productImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'last_message':
          result.lastMessage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'chats':
          result.chats = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'last_message_at':
          result.lastMessageAt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'last_message_by':
          result.lastMessageBy = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_details':
          result.userDetails.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(UserStruct)]))!
              as BuiltList<Object?>);
          break;
        case 'users':
          result.users.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
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

class _$ConversationsRecord extends ConversationsRecord {
  @override
  final String? productId;
  @override
  final String? productName;
  @override
  final String? productImage;
  @override
  final String? lastMessage;
  @override
  final DocumentReference<Object?>? chats;
  @override
  final int? lastMessageAt;
  @override
  final String? lastMessageBy;
  @override
  final BuiltList<UserStruct>? userDetails;
  @override
  final BuiltList<String>? users;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ConversationsRecord(
          [void Function(ConversationsRecordBuilder)? updates]) =>
      (new ConversationsRecordBuilder()..update(updates))._build();

  _$ConversationsRecord._(
      {this.productId,
      this.productName,
      this.productImage,
      this.lastMessage,
      this.chats,
      this.lastMessageAt,
      this.lastMessageBy,
      this.userDetails,
      this.users,
      this.ffRef})
      : super._();

  @override
  ConversationsRecord rebuild(
          void Function(ConversationsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConversationsRecordBuilder toBuilder() =>
      new ConversationsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConversationsRecord &&
        productId == other.productId &&
        productName == other.productName &&
        productImage == other.productImage &&
        lastMessage == other.lastMessage &&
        chats == other.chats &&
        lastMessageAt == other.lastMessageAt &&
        lastMessageBy == other.lastMessageBy &&
        userDetails == other.userDetails &&
        users == other.users &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, productId.hashCode);
    _$hash = $jc(_$hash, productName.hashCode);
    _$hash = $jc(_$hash, productImage.hashCode);
    _$hash = $jc(_$hash, lastMessage.hashCode);
    _$hash = $jc(_$hash, chats.hashCode);
    _$hash = $jc(_$hash, lastMessageAt.hashCode);
    _$hash = $jc(_$hash, lastMessageBy.hashCode);
    _$hash = $jc(_$hash, userDetails.hashCode);
    _$hash = $jc(_$hash, users.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConversationsRecord')
          ..add('productId', productId)
          ..add('productName', productName)
          ..add('productImage', productImage)
          ..add('lastMessage', lastMessage)
          ..add('chats', chats)
          ..add('lastMessageAt', lastMessageAt)
          ..add('lastMessageBy', lastMessageBy)
          ..add('userDetails', userDetails)
          ..add('users', users)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ConversationsRecordBuilder
    implements Builder<ConversationsRecord, ConversationsRecordBuilder> {
  _$ConversationsRecord? _$v;

  String? _productId;
  String? get productId => _$this._productId;
  set productId(String? productId) => _$this._productId = productId;

  String? _productName;
  String? get productName => _$this._productName;
  set productName(String? productName) => _$this._productName = productName;

  String? _productImage;
  String? get productImage => _$this._productImage;
  set productImage(String? productImage) => _$this._productImage = productImage;

  String? _lastMessage;
  String? get lastMessage => _$this._lastMessage;
  set lastMessage(String? lastMessage) => _$this._lastMessage = lastMessage;

  DocumentReference<Object?>? _chats;
  DocumentReference<Object?>? get chats => _$this._chats;
  set chats(DocumentReference<Object?>? chats) => _$this._chats = chats;

  int? _lastMessageAt;
  int? get lastMessageAt => _$this._lastMessageAt;
  set lastMessageAt(int? lastMessageAt) =>
      _$this._lastMessageAt = lastMessageAt;

  String? _lastMessageBy;
  String? get lastMessageBy => _$this._lastMessageBy;
  set lastMessageBy(String? lastMessageBy) =>
      _$this._lastMessageBy = lastMessageBy;

  ListBuilder<UserStruct>? _userDetails;
  ListBuilder<UserStruct> get userDetails =>
      _$this._userDetails ??= new ListBuilder<UserStruct>();
  set userDetails(ListBuilder<UserStruct>? userDetails) =>
      _$this._userDetails = userDetails;

  ListBuilder<String>? _users;
  ListBuilder<String> get users => _$this._users ??= new ListBuilder<String>();
  set users(ListBuilder<String>? users) => _$this._users = users;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ConversationsRecordBuilder() {
    ConversationsRecord._initializeBuilder(this);
  }

  ConversationsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _productId = $v.productId;
      _productName = $v.productName;
      _productImage = $v.productImage;
      _lastMessage = $v.lastMessage;
      _chats = $v.chats;
      _lastMessageAt = $v.lastMessageAt;
      _lastMessageBy = $v.lastMessageBy;
      _userDetails = $v.userDetails?.toBuilder();
      _users = $v.users?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConversationsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConversationsRecord;
  }

  @override
  void update(void Function(ConversationsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConversationsRecord build() => _build();

  _$ConversationsRecord _build() {
    _$ConversationsRecord _$result;
    try {
      _$result = _$v ??
          new _$ConversationsRecord._(
              productId: productId,
              productName: productName,
              productImage: productImage,
              lastMessage: lastMessage,
              chats: chats,
              lastMessageAt: lastMessageAt,
              lastMessageBy: lastMessageBy,
              userDetails: _userDetails?.build(),
              users: _users?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'userDetails';
        _userDetails?.build();
        _$failedField = 'users';
        _users?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ConversationsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
