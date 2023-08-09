import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateFormModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for description widget.
  TextEditingController? descriptionController1;
  String? Function(BuildContext, String?)? descriptionController1Validator;
  String? _descriptionController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ipc8vs1e' /* Это поле обязательно */,
      );
    }

    return null;
  }

  // State field(s) for description widget.
  TextEditingController? descriptionController2;
  String? Function(BuildContext, String?)? descriptionController2Validator;
  String? _descriptionController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ecs08e6r' /* Это поле обязательно */,
      );
    }

    return null;
  }

  // State field(s) for description widget.
  TextEditingController? descriptionController3;
  String? Function(BuildContext, String?)? descriptionController3Validator;
  String? _descriptionController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '28095pc9' /* Это поле обязательно */,
      );
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    descriptionController1Validator = _descriptionController1Validator;
    descriptionController2Validator = _descriptionController2Validator;
    descriptionController3Validator = _descriptionController3Validator;
  }

  void dispose() {
    descriptionController1?.dispose();
    descriptionController2?.dispose();
    descriptionController3?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
