import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _cardNumber = prefs.getString('ff_cardNumber') ?? _cardNumber;
    _cardHolderName = prefs.getString('ff_cardHolderName') ?? _cardHolderName;
    _cardName = prefs.getString('ff_cardName') ?? _cardName;
    _zipCode = prefs.getString('ff_zipCode') ?? _zipCode;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _cardNumber = '';
  String get cardNumber => _cardNumber;
  set cardNumber(String _value) {
    _cardNumber = _value;
    prefs.setString('ff_cardNumber', _value);
  }

  String _cardHolderName = '';
  String get cardHolderName => _cardHolderName;
  set cardHolderName(String _value) {
    _cardHolderName = _value;
    prefs.setString('ff_cardHolderName', _value);
  }

  String _cardName = '';
  String get cardName => _cardName;
  set cardName(String _value) {
    _cardName = _value;
    prefs.setString('ff_cardName', _value);
  }

  String _zipCode = '';
  String get zipCode => _zipCode;
  set zipCode(String _value) {
    _zipCode = _value;
    prefs.setString('ff_zipCode', _value);
  }

  String _emailField = '';
  String get emailField => _emailField;
  set emailField(String _value) {
    _emailField = _value;
  }

  List<String> _mediaUrl = [];
  List<String> get mediaUrl => _mediaUrl;
  set mediaUrl(List<String> _value) {
    _mediaUrl = _value;
  }

  void addToMediaUrl(String _value) {
    _mediaUrl.add(_value);
  }

  void removeFromMediaUrl(String _value) {
    _mediaUrl.remove(_value);
  }

  void removeAtIndexFromMediaUrl(int _index) {
    _mediaUrl.removeAt(_index);
  }

  List<DocumentReference> _savePost = [];
  List<DocumentReference> get savePost => _savePost;
  set savePost(List<DocumentReference> _value) {
    _savePost = _value;
  }

  void addToSavePost(DocumentReference _value) {
    _savePost.add(_value);
  }

  void removeFromSavePost(DocumentReference _value) {
    _savePost.remove(_value);
  }

  void removeAtIndexFromSavePost(int _index) {
    _savePost.removeAt(_index);
  }

  bool _showFullList = true;
  bool get showFullList => _showFullList;
  set showFullList(bool _value) {
    _showFullList = _value;
  }

  bool _showListView = false;
  bool get showListView => _showListView;
  set showListView(bool _value) {
    _showListView = _value;
  }

  bool _showgrid = true;
  bool get showgrid => _showgrid;
  set showgrid(bool _value) {
    _showgrid = _value;
  }

  bool _ListShow = true;
  bool get ListShow => _ListShow;
  set ListShow(bool _value) {
    _ListShow = _value;
  }

  String _userlocation = '';
  String get userlocation => _userlocation;
  set userlocation(String _value) {
    _userlocation = _value;
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool _value) {
    _isLoading = _value;
  }

  bool _showPickProductList = false;
  bool get showPickProductList => _showPickProductList;
  set showPickProductList(bool _value) {
    _showPickProductList = _value;
  }

  String _setLocation = '';
  String get setLocation => _setLocation;
  set setLocation(String _value) {
    _setLocation = _value;
  }

  bool _showDropdown = false;
  bool get showDropdown => _showDropdown;
  set showDropdown(bool _value) {
    _showDropdown = _value;
  }

  String _dropdownText = 'All';
  String get dropdownText => _dropdownText;
  set dropdownText(String _value) {
    _dropdownText = _value;
  }

  bool _showFree = false;
  bool get showFree => _showFree;
  set showFree(bool _value) {
    _showFree = _value;
  }

  bool _showExchange = false;
  bool get showExchange => _showExchange;
  set showExchange(bool _value) {
    _showExchange = _value;
  }

  List<String> _chatUsers = [];
  List<String> get chatUsers => _chatUsers;
  set chatUsers(List<String> _value) {
    _chatUsers = _value;
  }

  void addToChatUsers(String _value) {
    _chatUsers.add(_value);
  }

  void removeFromChatUsers(String _value) {
    _chatUsers.remove(_value);
  }

  void removeAtIndexFromChatUsers(int _index) {
    _chatUsers.removeAt(_index);
  }

  List<String> _chatUserDetail = [];
  List<String> get chatUserDetail => _chatUserDetail;
  set chatUserDetail(List<String> _value) {
    _chatUserDetail = _value;
  }

  void addToChatUserDetail(String _value) {
    _chatUserDetail.add(_value);
  }

  void removeFromChatUserDetail(String _value) {
    _chatUserDetail.remove(_value);
  }

  void removeAtIndexFromChatUserDetail(int _index) {
    _chatUserDetail.removeAt(_index);
  }

  bool _showUser = false;
  bool get showUser => _showUser;
  set showUser(bool _value) {
    _showUser = _value;
  }

  String _searchstring = '';
  String get searchstring => _searchstring;
  set searchstring(String _value) {
    _searchstring = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
