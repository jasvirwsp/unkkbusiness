import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'one_off_service_comp_widget.dart' show OneOffServiceCompWidget;
import 'package:flutter/material.dart';

class OneOffServiceCompModel extends FlutterFlowModel<OneOffServiceCompWidget> {
  ///  Local state fields for this component.

  DocumentReference? clientServiceReff;

  int serviceLoopCount = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for billingMode widget.
  String? billingModeValue;
  FormFieldController<String>? billingModeValueController;
  // State field(s) for priceType widget.
  String? priceTypeValue;
  FormFieldController<String>? priceTypeValueController;
  // State field(s) for qty widget.
  FocusNode? qtyFocusNode;
  TextEditingController? qtyController;
  String? Function(BuildContext, String?)? qtyControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in qty widget.
  List<ClientServicesRecord>? clientServicesCopyCopy;
  // Stores action output result for [Custom Action - createSubTotal] action in qty widget.
  double? serviceTotalCopy;
  // State field(s) for amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountController;
  String? Function(BuildContext, String?)? amountControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in amount widget.
  List<ClientServicesRecord>? clientServicesCopy;
  // Stores action output result for [Custom Action - createSubTotal] action in amount widget.
  double? serviceTotal;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    qtyFocusNode?.dispose();
    qtyController?.dispose();

    amountFocusNode?.dispose();
    amountController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
