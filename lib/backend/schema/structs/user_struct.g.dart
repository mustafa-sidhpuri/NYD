// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserStruct> _$userStructSerializer = new _$UserStructSerializer();

class _$UserStructSerializer implements StructuredSerializer<UserStruct> {
  @override
  final Iterable<Type> types = const [UserStruct, _$UserStruct];
  @override
  final String wireName = 'UserStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.userId;
    if (value != null) {
      result
        ..add('user_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userName;
    if (value != null) {
      result
        ..add('user_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userImage;
    if (value != null) {
      result
        ..add('user_image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  UserStruct deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'user_id':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_name':
          result.userName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_image':
          result.userImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$UserStruct extends UserStruct {
  @override
  final String? userId;
  @override
  final String? userName;
  @override
  final String? userImage;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$UserStruct([void Function(UserStructBuilder)? updates]) =>
      (new UserStructBuilder()..update(updates))._build();

  _$UserStruct._(
      {this.userId,
      this.userName,
      this.userImage,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'UserStruct', 'firestoreUtilData');
  }

  @override
  UserStruct rebuild(void Function(UserStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStructBuilder toBuilder() => new UserStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStruct &&
        userId == other.userId &&
        userName == other.userName &&
        userImage == other.userImage &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, userName.hashCode);
    _$hash = $jc(_$hash, userImage.hashCode);
    _$hash = $jc(_$hash, firestoreUtilData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserStruct')
          ..add('userId', userId)
          ..add('userName', userName)
          ..add('userImage', userImage)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class UserStructBuilder implements Builder<UserStruct, UserStructBuilder> {
  _$UserStruct? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  String? _userName;
  String? get userName => _$this._userName;
  set userName(String? userName) => _$this._userName = userName;

  String? _userImage;
  String? get userImage => _$this._userImage;
  set userImage(String? userImage) => _$this._userImage = userImage;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  UserStructBuilder() {
    UserStruct._initializeBuilder(this);
  }

  UserStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _userName = $v.userName;
      _userImage = $v.userImage;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserStruct;
  }

  @override
  void update(void Function(UserStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserStruct build() => _build();

  _$UserStruct _build() {
    final _$result = _$v ??
        new _$UserStruct._(
            userId: userId,
            userName: userName,
            userImage: userImage,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'UserStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
