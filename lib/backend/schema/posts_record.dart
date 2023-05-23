import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/algolia_manager.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostsRecord extends FirestoreRecord {
  PostsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "category_id" field.
  String? _categoryId;
  String get categoryId => _categoryId ?? '';
  bool hasCategoryId() => _categoryId != null;

  // "post_type" field.
  String? _postType;
  String get postType => _postType ?? '';
  bool hasPostType() => _postType != null;

  // "food_type" field.
  String? _foodType;
  String get foodType => _foodType ?? '';
  bool hasFoodType() => _foodType != null;

  // "latlong" field.
  LatLng? _latlong;
  LatLng? get latlong => _latlong;
  bool hasLatlong() => _latlong != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "public" field.
  bool? _public;
  bool get public => _public ?? false;
  bool hasPublic() => _public != null;

  // "is_picked_up" field.
  bool? _isPickedUp;
  bool get isPickedUp => _isPickedUp ?? false;
  bool hasIsPickedUp() => _isPickedUp != null;

  // "pickup" field.
  PickupStruct? _pickup;
  PickupStruct get pickup => _pickup ?? PickupStruct();
  bool hasPickup() => _pickup != null;

  // "conversations" field.
  List<String>? _conversations;
  List<String> get conversations => _conversations ?? const [];
  bool hasConversations() => _conversations != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "sub_category" field.
  String? _subCategory;
  String get subCategory => _subCategory ?? '';
  bool hasSubCategory() => _subCategory != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "posted_by" field.
  String? _postedBy;
  String get postedBy => _postedBy ?? '';
  bool hasPostedBy() => _postedBy != null;

  // "posted_byName" field.
  String? _postedByName;
  String get postedByName => _postedByName ?? '';
  bool hasPostedByName() => _postedByName != null;

  // "posted_byProfile" field.
  String? _postedByProfile;
  String get postedByProfile => _postedByProfile ?? '';
  bool hasPostedByProfile() => _postedByProfile != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _categoryId = snapshotData['category_id'] as String?;
    _postType = snapshotData['post_type'] as String?;
    _foodType = snapshotData['food_type'] as String?;
    _latlong = snapshotData['latlong'] as LatLng?;
    _address = snapshotData['address'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _public = snapshotData['public'] as bool?;
    _isPickedUp = snapshotData['is_picked_up'] as bool?;
    _pickup = PickupStruct.maybeFromMap(snapshotData['pickup']);
    _conversations = getDataList(snapshotData['conversations']);
    _images = getDataList(snapshotData['images']);
    _subCategory = snapshotData['sub_category'] as String?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _postedBy = snapshotData['posted_by'] as String?;
    _postedByName = snapshotData['posted_byName'] as String?;
    _postedByProfile = snapshotData['posted_byProfile'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostsRecord.fromSnapshot(s));

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostsRecord.fromSnapshot(s));

  static PostsRecord fromSnapshot(DocumentSnapshot snapshot) => PostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostsRecord._(reference, mapFromFirestore(data));

  static PostsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      PostsRecord.getDocumentFromData(
        {
          'name': snapshot.data['name'],
          'description': snapshot.data['description'],
          'category_id': snapshot.data['category_id'],
          'post_type': snapshot.data['post_type'],
          'food_type': snapshot.data['food_type'],
          'latlong': safeGet(
            () => LatLng(
              snapshot.data['_geoloc']['lat'],
              snapshot.data['_geoloc']['lng'],
            ),
          ),
          'address': snapshot.data['address'],
          'created_at': safeGet(
            () => DateTime.fromMillisecondsSinceEpoch(
                snapshot.data['created_at']),
          ),
          'updated_at': safeGet(
            () => DateTime.fromMillisecondsSinceEpoch(
                snapshot.data['updated_at']),
          ),
          'public': snapshot.data['public'],
          'is_picked_up': snapshot.data['is_picked_up'],
          'pickup': createPickupStruct(
            userId: (snapshot.data['pickup'] ?? {})['user_id'],
            userName: (snapshot.data['pickup'] ?? {})['user_name'],
            userImage: (snapshot.data['pickup'] ?? {})['user_image'],
            pickupTime: safeGet(
              () => DateTime.fromMillisecondsSinceEpoch(
                  (snapshot.data['pickup'] ?? {})['pickup_time']),
            ),
            create: true,
            clearUnsetFields: false,
          ).toMap(),
          'conversations': safeGet(
            () => snapshot.data['conversations'].toList(),
          ),
          'images': safeGet(
            () => snapshot.data['images'].toList(),
          ),
          'sub_category': snapshot.data['sub_category'],
          'user_ref': safeGet(
            () => toRef(snapshot.data['user_ref']),
          ),
          'posted_by': snapshot.data['posted_by'],
          'posted_byName': snapshot.data['posted_byName'],
          'posted_byProfile': snapshot.data['posted_byProfile'],
        },
        PostsRecord.collection.doc(snapshot.objectID),
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

  @override
  String toString() =>
      'PostsRecord(reference: ${reference.path}, data: $snapshotData)';
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
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'category_id': categoryId,
      'post_type': postType,
      'food_type': foodType,
      'latlong': latlong,
      'address': address,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'public': public,
      'is_picked_up': isPickedUp,
      'pickup': PickupStruct().toMap(),
      'sub_category': subCategory,
      'user_ref': userRef,
      'posted_by': postedBy,
      'posted_byName': postedByName,
      'posted_byProfile': postedByProfile,
    }.withoutNulls,
  );

  // Handle nested data for "pickup" field.
  addPickupStructData(firestoreData, pickup, 'pickup');

  return firestoreData;
}
