import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class RegistrationPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for Email widget.
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  String? _emailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hmv71fw8' /* Это поле обязательно */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'ew1g5vng' /* Почта выглядит странно */,
      );
    }
    return null;
  }

  // State field(s) for Password widget.
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  String? _passwordControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0hdvbipv' /* Это поле обязательно */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        'mviifufh' /* Минимум 6 символов */,
      );
    }

    return null;
  }

  // State field(s) for PasswordVerification widget.
  TextEditingController? passwordVerificationController;
  late bool passwordVerificationVisibility;
  String? Function(BuildContext, String?)?
      passwordVerificationControllerValidator;
  String? _passwordVerificationControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'bkdi370w' /* Это поле обязательно */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        'tad82tst' /* Минимум 6 символов */,
      );
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    emailControllerValidator = _emailControllerValidator;
    passwordVisibility = false;
    passwordControllerValidator = _passwordControllerValidator;
    passwordVerificationVisibility = false;
    passwordVerificationControllerValidator =
        _passwordVerificationControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    emailController?.dispose();
    passwordController?.dispose();
    passwordVerificationController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
