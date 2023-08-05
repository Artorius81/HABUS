import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/schema/structs/index.dart';
import 'backend/supabase/supabase.dart';
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
    _safeInit(() {
      _firstName = prefs.getString('ff_firstName') ?? _firstName;
    });
    _safeInit(() {
      _lastName = prefs.getString('ff_lastName') ?? _lastName;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  UserStruct _user = UserStruct();
  UserStruct get user => _user;
  set user(UserStruct _value) {
    _user = _value;
  }

  void updateUserStruct(Function(UserStruct) updateFn) {
    updateFn(_user);
  }

  String _firstName = '';
  String get firstName => _firstName;
  set firstName(String _value) {
    _firstName = _value;
    prefs.setString('ff_firstName', _value);
  }

  String _lastName = '';
  String get lastName => _lastName;
  set lastName(String _value) {
    _lastName = _value;
    prefs.setString('ff_lastName', _value);
  }

  final _userProfileInfoManager = FutureRequestManager<List<ProfileRow>>();
  Future<List<ProfileRow>> userProfileInfo({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<ProfileRow>> Function() requestFn,
  }) =>
      _userProfileInfoManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserProfileInfoCache() => _userProfileInfoManager.clear();
  void clearUserProfileInfoCacheKey(String? uniqueKey) =>
      _userProfileInfoManager.clearRequest(uniqueKey);
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

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
