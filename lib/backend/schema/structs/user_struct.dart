// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    bool? isRegistration,
  }) : _isRegistration = isRegistration;

  // "isRegistration" field.
  bool? _isRegistration;
  bool get isRegistration => _isRegistration ?? false;
  set isRegistration(bool? val) => _isRegistration = val;
  bool hasIsRegistration() => _isRegistration != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        isRegistration: data['isRegistration'] as bool?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? UserStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'isRegistration': _isRegistration,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'isRegistration': serializeParam(
          _isRegistration,
          ParamType.bool,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        isRegistration: deserializeParam(
          data['isRegistration'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserStruct && isRegistration == other.isRegistration;
  }

  @override
  int get hashCode => const ListEquality().hash([isRegistration]);
}

UserStruct createUserStruct({
  bool? isRegistration,
}) =>
    UserStruct(
      isRegistration: isRegistration,
    );
