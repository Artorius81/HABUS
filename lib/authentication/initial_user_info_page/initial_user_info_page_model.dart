import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';

class InitialUserInfoPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for firstUserName widget.
  TextEditingController? firstUserNameController;
  String? Function(BuildContext, String?)? firstUserNameControllerValidator;
  String? _firstUserNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hfzlsc9h' /* Это поле обязятельно */,
      );
    }

    return null;
  }

  // State field(s) for lastUserName widget.
  TextEditingController? lastUserNameController;
  String? Function(BuildContext, String?)? lastUserNameControllerValidator;
  String? _lastUserNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'a7dc3fey' /* Это поле обязательно */,
      );
    }

    return null;
  }

  // State field(s) for roleChoice widget.
  String? roleChoiceValue;
  FormFieldController<String>? roleChoiceValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    firstUserNameControllerValidator = _firstUserNameControllerValidator;
    lastUserNameControllerValidator = _lastUserNameControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    firstUserNameController?.dispose();
    lastUserNameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
