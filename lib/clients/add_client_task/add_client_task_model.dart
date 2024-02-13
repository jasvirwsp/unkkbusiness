import '/flutter_flow/flutter_flow_util.dart';
import 'add_client_task_widget.dart' show AddClientTaskWidget;
import 'package:flutter/material.dart';

class AddClientTaskModel extends FlutterFlowModel<AddClientTaskWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for taskName widget.
  FocusNode? taskNameFocusNode;
  TextEditingController? taskNameController;
  String? Function(BuildContext, String?)? taskNameControllerValidator;
  // State field(s) for dueDate widget.
  FocusNode? dueDateFocusNode;
  TextEditingController? dueDateController;
  String? Function(BuildContext, String?)? dueDateControllerValidator;
  // State field(s) for assignee widget.
  FocusNode? assigneeFocusNode;
  TextEditingController? assigneeController;
  String? Function(BuildContext, String?)? assigneeControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    taskNameFocusNode?.dispose();
    taskNameController?.dispose();

    dueDateFocusNode?.dispose();
    dueDateController?.dispose();

    assigneeFocusNode?.dispose();
    assigneeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
