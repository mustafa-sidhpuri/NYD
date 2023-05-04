// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersStruct> _$usersStructSerializer = new _$UsersStructSerializer();

class _$UsersStructSerializer implements StructuredSerializer<UsersStruct> {
  @override
  final Iterable<Type> types = const [UsersStruct, _$UsersStruct];
  @override
  final String wireName = 'UsersStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, UsersStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.read;
    if (value != null) {
      result
        ..add('read')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.userId;
    if (value != null) {
      result
        ..add('user_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  UsersStruct deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'read':
          result.read = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'user_id':
          result.userId = serializers.deserialize(value,
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

class _$UsersStruct extends UsersStruct {
  @override
  final bool? read;
  @override
  final String? userId;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$UsersStruct([void Function(UsersStructBuilder)? updates]) =>
      (new UsersStructBuilder()..update(updates))._build();

  _$UsersStruct._({this.read, this.userId, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'UsersStruct', 'firestoreUtilData');
  }

  @override
  UsersStruct rebuild(void Function(UsersStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersStructBuilder toBuilder() => new UsersStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersStruct &&
        read == other.read &&
        userId == other.userId &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, read.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, firestoreUtilData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersStruct')
          ..add('read', read)
          ..add('userId', userId)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class UsersStructBuilder implements Builder<UsersStruct, UsersStructBuilder> {
  _$UsersStruct? _$v;

  bool? _read;
  bool? get read => _$this._read;
  set read(bool? read) => _$this._read = read;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  UsersStructBuilder() {
    UsersStruct._initializeBuilder(this);
  }

  UsersStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _read = $v.read;
      _userId = $v.userId;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersStruct;
  }

  @override
  void update(void Function(UsersStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersStruct build() => _build();

  _$UsersStruct _build() {
    final _$result = _$v ??
        new _$UsersStruct._(
            read: read,
            userId: userId,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'UsersStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
