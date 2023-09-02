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
    _safeInit(() {
      _role = prefs.getString('ff_role') ?? _role;
    });
    _safeInit(() {
      _status = prefs.getString('ff_status') ?? _status;
    });
    _safeInit(() {
      _department = prefs.getString('ff_department') ?? _department;
    });
    _safeInit(() {
      _group = prefs.getString('ff_group') ?? _group;
    });
    _safeInit(() {
      _profilePhoto = prefs.getString('ff_profilePhoto') ?? _profilePhoto;
    });
    _safeInit(() {
      _email = prefs.getString('ff_email') ?? _email;
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

  String _role = '';
  String get role => _role;
  set role(String _value) {
    _role = _value;
    prefs.setString('ff_role', _value);
  }

  String _status = '';
  String get status => _status;
  set status(String _value) {
    _status = _value;
    prefs.setString('ff_status', _value);
  }

  String _department = '';
  String get department => _department;
  set department(String _value) {
    _department = _value;
    prefs.setString('ff_department', _value);
  }

  String _group = '';
  String get group => _group;
  set group(String _value) {
    _group = _value;
    prefs.setString('ff_group', _value);
  }

  String _profilePhoto =
      'https://www.pngkit.com/png/full/202-2022289_web-reconceptualization-and-redesign-of-carnet-jove-android.png';
  String get profilePhoto => _profilePhoto;
  set profilePhoto(String _value) {
    _profilePhoto = _value;
    prefs.setString('ff_profilePhoto', _value);
  }

  String _email = '';
  String get email => _email;
  set email(String _value) {
    _email = _value;
    prefs.setString('ff_email', _value);
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
