import '/backend/backend.dart';
import '/components/one_off_service_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'onboard_one_off_services_list_widget.dart'
    show OnboardOneOffServicesListWidget;
import 'package:flutter/material.dart';

class OnboardOneOffServicesListModel
    extends FlutterFlowModel<OnboardOneOffServicesListWidget> {
  ///  Local state fields for this page.

  int servicesLoopCount = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in onboardOneOffServicesList widget.
  List<ClientServicesRecord>? clientServices;
  // Stores action output result for [Custom Action - createSubTotal] action in onboardOneOffServicesList widget.
  double? serviceTotal;
  // Models for oneOffServiceComp dynamic component.
  late FlutterFlowDynamicModels<OneOffServiceCompModel> oneOffServiceCompModels;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    oneOffServiceCompModels =
        FlutterFlowDynamicModels(() => OneOffServiceCompModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    oneOffServiceCompModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
