import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for searchField widget.
  TextEditingController? searchFieldController1;
  String? Function(BuildContext, String?)? searchFieldController1Validator;
  // State field(s) for searchField widget.
  TextEditingController? searchFieldController2;
  String? Function(BuildContext, String?)? searchFieldController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    searchFieldController1?.dispose();
    searchFieldController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
