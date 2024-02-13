import '/flutter_flow/flutter_flow_util.dart';
import 'client_task_detail_widget.dart' show ClientTaskDetailWidget;
import 'package:flutter/material.dart';

class ClientTaskDetailModel extends FlutterFlowModel<ClientTaskDetailWidget> {
  ///  Local state fields for this page.

  int tableRows = 3;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for task widget.
  FocusNode? taskFocusNode1;
  TextEditingController? taskController1;
  String? Function(BuildContext, String?)? taskController1Validator;
  // State field(s) for date widget.
  FocusNode? dateFocusNode1;
  TextEditingController? dateController1;
  String? Function(BuildContext, String?)? dateController1Validator;
  // State field(s) for assignee widget.
  FocusNode? assigneeFocusNode1;
  TextEditingController? assigneeController1;
  String? Function(BuildContext, String?)? assigneeController1Validator;
  // State field(s) for task widget.
  FocusNode? taskFocusNode2;
  TextEditingController? taskController2;
  String? Function(BuildContext, String?)? taskController2Validator;
  // State field(s) for date widget.
  FocusNode? dateFocusNode2;
  TextEditingController? dateController2;
  String? Function(BuildContext, String?)? dateController2Validator;
  // State field(s) for assignee widget.
  FocusNode? assigneeFocusNode2;
  TextEditingController? assigneeController2;
  String? Function(BuildContext, String?)? assigneeController2Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    taskFocusNode1?.dispose();
    taskController1?.dispose();

    dateFocusNode1?.dispose();
    dateController1?.dispose();

    assigneeFocusNode1?.dispose();
    assigneeController1?.dispose();

    taskFocusNode2?.dispose();
    taskController2?.dispose();

    dateFocusNode2?.dispose();
    dateController2?.dispose();

    assigneeFocusNode2?.dispose();
    assigneeController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
