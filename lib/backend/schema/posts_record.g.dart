// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PostsRecord> _$postsRecordSerializer = new _$PostsRecordSerializer();

class _$PostsRecordSerializer implements StructuredSerializer<PostsRecord> {
  @override
  final Iterable<Type> types = const [PostsRecord, _$PostsRecord];
  @override
  final String wireName = 'PostsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PostsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'pickup',
      serializers.serialize(object.pickup,
          specifiedType: const FullType(PickupStruct)),
    ];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.categoryId;
    if (value != null) {
      result
        ..add('category_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postType;
    if (value != null) {
      result
        ..add('post_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.foodType;
    if (value != null) {
      result
        ..add('food_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.latlong;
    if (value != null) {
      result
        ..add('latlong')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
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
    value = object.updatedAt;
    if (value != null) {
      result
        ..add('updated_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.public;
    if (value != null) {
      result
        ..add('public')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isPickedUp;
    if (value != null) {
      result
        ..add('is_picked_up')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.conversations;
    if (value != null) {
      result
        ..add('conversations')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.images;
    if (value != null) {
      result
        ..add('images')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.subCategory;
    if (value != null) {
      result
        ..add('sub_category')
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
    value = object.postedBy;
    if (value != null) {
      result
        ..add('posted_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postedByName;
    if (value != null) {
      result
        ..add('posted_byName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postedByProfile;
    if (value != null) {
      result
        ..add('posted_byProfile')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  PostsRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'category_id':
          result.categoryId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'post_type':
          result.postType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'food_type':
          result.foodType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'latlong':
          result.latlong = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'updated_at':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'public':
          result.public = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'is_picked_up':
          result.isPickedUp = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'pickup':
          result.pickup.replace(serializers.deserialize(value,
              specifiedType: const FullType(PickupStruct))! as PickupStruct);
          break;
        case 'conversations':
          result.conversations.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'images':
          result.images.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'sub_category':
          result.subCategory = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_ref':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'posted_by':
          result.postedBy = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'posted_byName':
          result.postedByName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'posted_byProfile':
          result.postedByProfile = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$PostsRecord extends PostsRecord {
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? categoryId;
  @override
  final String? postType;
  @override
  final String? foodType;
  @override
  final LatLng? latlong;
  @override
  final String? address;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final bool? public;
  @override
  final bool? isPickedUp;
  @override
  final PickupStruct pickup;
  @override
  final BuiltList<String>? conversations;
  @override
  final BuiltList<String>? images;
  @override
  final String? subCategory;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final String? postedBy;
  @override
  final String? postedByName;
  @override
  final String? postedByProfile;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PostsRecord([void Function(PostsRecordBuilder)? updates]) =>
      (new PostsRecordBuilder()..update(updates))._build();

  _$PostsRecord._(
      {this.name,
      this.description,
      this.categoryId,
      this.postType,
      this.foodType,
      this.latlong,
      this.address,
      this.createdAt,
      this.updatedAt,
      this.public,
      this.isPickedUp,
      required this.pickup,
      this.conversations,
      this.images,
      this.subCategory,
      this.userRef,
      this.postedBy,
      this.postedByName,
      this.postedByProfile,
      this.ffRef})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(pickup, r'PostsRecord', 'pickup');
  }

  @override
  PostsRecord rebuild(void Function(PostsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostsRecordBuilder toBuilder() => new PostsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostsRecord &&
        name == other.name &&
        description == other.description &&
        categoryId == other.categoryId &&
        postType == other.postType &&
        foodType == other.foodType &&
        latlong == other.latlong &&
        address == other.address &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        public == other.public &&
        isPickedUp == other.isPickedUp &&
        pickup == other.pickup &&
        conversations == other.conversations &&
        images == other.images &&
        subCategory == other.subCategory &&
        userRef == other.userRef &&
        postedBy == other.postedBy &&
        postedByName == other.postedByName &&
        postedByProfile == other.postedByProfile &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, categoryId.hashCode);
    _$hash = $jc(_$hash, postType.hashCode);
    _$hash = $jc(_$hash, foodType.hashCode);
    _$hash = $jc(_$hash, latlong.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jc(_$hash, public.hashCode);
    _$hash = $jc(_$hash, isPickedUp.hashCode);
    _$hash = $jc(_$hash, pickup.hashCode);
    _$hash = $jc(_$hash, conversations.hashCode);
    _$hash = $jc(_$hash, images.hashCode);
    _$hash = $jc(_$hash, subCategory.hashCode);
    _$hash = $jc(_$hash, userRef.hashCode);
    _$hash = $jc(_$hash, postedBy.hashCode);
    _$hash = $jc(_$hash, postedByName.hashCode);
    _$hash = $jc(_$hash, postedByProfile.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PostsRecord')
          ..add('name', name)
          ..add('description', description)
          ..add('categoryId', categoryId)
          ..add('postType', postType)
          ..add('foodType', foodType)
          ..add('latlong', latlong)
          ..add('address', address)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('public', public)
          ..add('isPickedUp', isPickedUp)
          ..add('pickup', pickup)
          ..add('conversations', conversations)
          ..add('images', images)
          ..add('subCategory', subCategory)
          ..add('userRef', userRef)
          ..add('postedBy', postedBy)
          ..add('postedByName', postedByName)
          ..add('postedByProfile', postedByProfile)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PostsRecordBuilder implements Builder<PostsRecord, PostsRecordBuilder> {
  _$PostsRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _categoryId;
  String? get categoryId => _$this._categoryId;
  set categoryId(String? categoryId) => _$this._categoryId = categoryId;

  String? _postType;
  String? get postType => _$this._postType;
  set postType(String? postType) => _$this._postType = postType;

  String? _foodType;
  String? get foodType => _$this._foodType;
  set foodType(String? foodType) => _$this._foodType = foodType;

  LatLng? _latlong;
  LatLng? get latlong => _$this._latlong;
  set latlong(LatLng? latlong) => _$this._latlong = latlong;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  bool? _public;
  bool? get public => _$this._public;
  set public(bool? public) => _$this._public = public;

  bool? _isPickedUp;
  bool? get isPickedUp => _$this._isPickedUp;
  set isPickedUp(bool? isPickedUp) => _$this._isPickedUp = isPickedUp;

  PickupStructBuilder? _pickup;
  PickupStructBuilder get pickup =>
      _$this._pickup ??= new PickupStructBuilder();
  set pickup(PickupStructBuilder? pickup) => _$this._pickup = pickup;

  ListBuilder<String>? _conversations;
  ListBuilder<String> get conversations =>
      _$this._conversations ??= new ListBuilder<String>();
  set conversations(ListBuilder<String>? conversations) =>
      _$this._conversations = conversations;

  ListBuilder<String>? _images;
  ListBuilder<String> get images =>
      _$this._images ??= new ListBuilder<String>();
  set images(ListBuilder<String>? images) => _$this._images = images;

  String? _subCategory;
  String? get subCategory => _$this._subCategory;
  set subCategory(String? subCategory) => _$this._subCategory = subCategory;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  String? _postedBy;
  String? get postedBy => _$this._postedBy;
  set postedBy(String? postedBy) => _$this._postedBy = postedBy;

  String? _postedByName;
  String? get postedByName => _$this._postedByName;
  set postedByName(String? postedByName) => _$this._postedByName = postedByName;

  String? _postedByProfile;
  String? get postedByProfile => _$this._postedByProfile;
  set postedByProfile(String? postedByProfile) =>
      _$this._postedByProfile = postedByProfile;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PostsRecordBuilder() {
    PostsRecord._initializeBuilder(this);
  }

  PostsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _categoryId = $v.categoryId;
      _postType = $v.postType;
      _foodType = $v.foodType;
      _latlong = $v.latlong;
      _address = $v.address;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _public = $v.public;
      _isPickedUp = $v.isPickedUp;
      _pickup = $v.pickup.toBuilder();
      _conversations = $v.conversations?.toBuilder();
      _images = $v.images?.toBuilder();
      _subCategory = $v.subCategory;
      _userRef = $v.userRef;
      _postedBy = $v.postedBy;
      _postedByName = $v.postedByName;
      _postedByProfile = $v.postedByProfile;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PostsRecord;
  }

  @override
  void update(void Function(PostsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PostsRecord build() => _build();

  _$PostsRecord _build() {
    _$PostsRecord _$result;
    try {
      _$result = _$v ??
          new _$PostsRecord._(
              name: name,
              description: description,
              categoryId: categoryId,
              postType: postType,
              foodType: foodType,
              latlong: latlong,
              address: address,
              createdAt: createdAt,
              updatedAt: updatedAt,
              public: public,
              isPickedUp: isPickedUp,
              pickup: pickup.build(),
              conversations: _conversations?.build(),
              images: _images?.build(),
              subCategory: subCategory,
              userRef: userRef,
              postedBy: postedBy,
              postedByName: postedByName,
              postedByProfile: postedByProfile,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pickup';
        pickup.build();
        _$failedField = 'conversations';
        _conversations?.build();
        _$failedField = 'images';
        _images?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PostsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
