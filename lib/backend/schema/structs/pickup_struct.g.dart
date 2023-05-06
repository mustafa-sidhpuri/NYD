// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pickup_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PickupStruct> _$pickupStructSerializer =
    new _$PickupStructSerializer();

class _$PickupStructSerializer implements StructuredSerializer<PickupStruct> {
  @override
  final Iterable<Type> types = const [PickupStruct, _$PickupStruct];
  @override
  final String wireName = 'PickupStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, PickupStruct object,
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
    value = object.pickupTime;
    if (value != null) {
      result
        ..add('pickup_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    return result;
  }

  @override
  PickupStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PickupStructBuilder();

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
        case 'pickup_time':
          result.pickupTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$PickupStruct extends PickupStruct {
  @override
  final String? userId;
  @override
  final String? userName;
  @override
  final String? userImage;
  @override
  final DateTime? pickupTime;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$PickupStruct([void Function(PickupStructBuilder)? updates]) =>
      (new PickupStructBuilder()..update(updates))._build();

  _$PickupStruct._(
      {this.userId,
      this.userName,
      this.userImage,
      this.pickupTime,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'PickupStruct', 'firestoreUtilData');
  }

  @override
  PickupStruct rebuild(void Function(PickupStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PickupStructBuilder toBuilder() => new PickupStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PickupStruct &&
        userId == other.userId &&
        userName == other.userName &&
        userImage == other.userImage &&
        pickupTime == other.pickupTime &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, userName.hashCode);
    _$hash = $jc(_$hash, userImage.hashCode);
    _$hash = $jc(_$hash, pickupTime.hashCode);
    _$hash = $jc(_$hash, firestoreUtilData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PickupStruct')
          ..add('userId', userId)
          ..add('userName', userName)
          ..add('userImage', userImage)
          ..add('pickupTime', pickupTime)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class PickupStructBuilder
    implements Builder<PickupStruct, PickupStructBuilder> {
  _$PickupStruct? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  String? _userName;
  String? get userName => _$this._userName;
  set userName(String? userName) => _$this._userName = userName;

  String? _userImage;
  String? get userImage => _$this._userImage;
  set userImage(String? userImage) => _$this._userImage = userImage;

  DateTime? _pickupTime;
  DateTime? get pickupTime => _$this._pickupTime;
  set pickupTime(DateTime? pickupTime) => _$this._pickupTime = pickupTime;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  PickupStructBuilder() {
    PickupStruct._initializeBuilder(this);
  }

  PickupStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _userName = $v.userName;
      _userImage = $v.userImage;
      _pickupTime = $v.pickupTime;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PickupStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PickupStruct;
  }

  @override
  void update(void Function(PickupStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PickupStruct build() => _build();

  _$PickupStruct _build() {
    final _$result = _$v ??
        new _$PickupStruct._(
            userId: userId,
            userName: userName,
            userImage: userImage,
            pickupTime: pickupTime,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'PickupStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
