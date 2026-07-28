import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'referra_buttom_sheet_widget.dart' show ReferraButtomSheetWidget;
import 'package:flutter/material.dart';

class ReferraButtomSheetModel
    extends FlutterFlowModel<ReferraButtomSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? referrerUser;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
