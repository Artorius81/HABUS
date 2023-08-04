import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

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
