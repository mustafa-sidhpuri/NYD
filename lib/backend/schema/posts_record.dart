import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'posts_record.g.dart';

abstract class PostsRecord implements Built<PostsRecord, PostsRecordBuilder> {
  static Serializer<PostsRecord> get serializer => _$postsRecordSerializer;

  String? get name;

  String? get description;

  @BuiltValueField(wireName: 'category_id')
  String? get categoryId;

  @BuiltValueField(wireName: 'post_type')
  String? get postType;

  @BuiltValueField(wireName: 'food_type')
  String? get foodType;

  LatLng? get latlong;

  String? get address;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'updated_at')
  DateTime? get updatedAt;

  bool? get public;

  @BuiltValueField(wireName: 'is_picked_up')
  bool? get isPickedUp;

  PickupStruct get pickup;

  BuiltList<String>? get conversations;

  BuiltList<String>? get images;

  @BuiltValueField(wireName: 'sub_category')
  String? get subCategory;

  @BuiltValueField(wireName: 'user_ref')
  DocumentReference? get userRef;

  @BuiltValueField(wireName: 'posted_by')
  String? get postedBy;

  @BuiltValueField(wireName: 'posted_byName')
  String? get postedByName;

  @BuiltValueField(wireName: 'posted_byProfile')
  String? get postedByProfile;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PostsRecordBuilder builder) => builder
    ..name = ''
    ..description = ''
    ..categoryId = ''
    ..postType = ''
    ..foodType = ''
    ..address = ''
    ..public = false
    ..isPickedUp = false
    ..pickup = PickupStructBuilder()
    ..conversations = ListBuilder()
    ..images = ListBuilder()
    ..subCategory = ''
    ..postedBy = ''
    ..postedByName = ''
    ..postedByProfile = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static PostsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) => PostsRecord(
        (c) => c
          ..name = snapshot.data['name']
          ..description = snapshot.data['description']
          ..categoryId = snapshot.data['category_id']
          ..postType = snapshot.data['post_type']
          ..foodType = snapshot.data['food_type']
          ..latlong = safeGet(() => LatLng(
                snapshot.data['_geoloc']['lat'],
                snapshot.data['_geoloc']['lng'],
              ))
          ..address = snapshot.data['address']
          ..createdAt = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['created_at']))
          ..updatedAt = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['updated_at']))
          ..public = snapshot.data['public']
          ..isPickedUp = snapshot.data['is_picked_up']
          ..pickup = createPickupStruct(
            userId: (snapshot.data['pickup'] ?? {})['user_id'],
            userName: (snapshot.data['pickup'] ?? {})['user_name'],
            userImage: (snapshot.data['pickup'] ?? {})['user_image'],
            create: true,
            clearUnsetFields: false,
          ).toBuilder()
          ..conversations =
              safeGet(() => ListBuilder(snapshot.data['conversations']))
          ..images = safeGet(() => ListBuilder(snapshot.data['images']))
          ..subCategory = snapshot.data['sub_category']
          ..userRef = safeGet(() => toRef(snapshot.data['user_ref']))
          ..postedBy = snapshot.data['posted_by']
          ..postedByName = snapshot.data['posted_byName']
          ..postedByProfile = snapshot.data['posted_byProfile']
          ..ffRef = PostsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<PostsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'Posts',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  PostsRecord._();
  factory PostsRecord([void Function(PostsRecordBuilder) updates]) =
      _$PostsRecord;

  static PostsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPostsRecordData({
  String? name,
  String? description,
  String? categoryId,
  String? postType,
  String? foodType,
  LatLng? latlong,
  String? address,
  DateTime? createdAt,
  DateTime? updatedAt,
  bool? public,
  bool? isPickedUp,
  PickupStruct? pickup,
  String? subCategory,
  DocumentReference? userRef,
  String? postedBy,
  String? postedByName,
  String? postedByProfile,
}) {
  final firestoreData = serializers.toFirestore(
    PostsRecord.serializer,
    PostsRecord(
      (p) => p
        ..name = name
        ..description = description
        ..categoryId = categoryId
        ..postType = postType
        ..foodType = foodType
        ..latlong = latlong
        ..address = address
        ..createdAt = createdAt
        ..updatedAt = updatedAt
        ..public = public
        ..isPickedUp = isPickedUp
        ..pickup = PickupStructBuilder()
        ..conversations = null
        ..images = null
        ..subCategory = subCategory
        ..userRef = userRef
        ..postedBy = postedBy
        ..postedByName = postedByName
        ..postedByProfile = postedByProfile,
    ),
  );

  // Handle nested data for "pickup" field.
  addPickupStructData(firestoreData, pickup, 'pickup');

  return firestoreData;
}
