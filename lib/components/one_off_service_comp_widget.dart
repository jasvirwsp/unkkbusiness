import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'one_off_service_comp_model.dart';
export 'one_off_service_comp_model.dart';

class OneOffServiceCompWidget extends StatefulWidget {
  const OneOffServiceCompWidget({super.key});

  @override
  State<OneOffServiceCompWidget> createState() =>
      _OneOffServiceCompWidgetState();
}

class _OneOffServiceCompWidgetState extends State<OneOffServiceCompWidget> {
  late OneOffServiceCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OneOffServiceCompModel());

    _model.qtyFocusNode ??= FocusNode();

    _model.amountFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<ClientServicesRecord>(
      stream: ClientServicesRecord.getDocument(_model.clientServiceReff!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        final columnClientServicesRecord = snapshot.data!;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 14.0),
              child: StreamBuilder<ServicesRecord>(
                stream: ServicesRecord.getDocument(
                    columnClientServicesRecord.serviceRef!),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  final rowServicesRecord = snapshot.data!;
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          rowServicesRecord.name,
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                      Container(
                        width: 200.0,
                        decoration: const BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FlutterFlowDropDown<String>(
                              controller: _model.billingModeValueController ??=
                                  FormFieldController<String>(null),
                              options: const ['Automatic', 'Manual'],
                              onChanged: (val) async {
                                setState(() => _model.billingModeValue = val);
                                await columnClientServicesRecord.reference
                                    .update(createClientServicesRecordData(
                                  billingMode: _model.billingModeValue,
                                ));
                              },
                              width: 120.0,
                              height: 30.0,
                              textStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              hintText: 'Billing Mode',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: const Color(0xFFFCFCFC),
                              elevation: 0.0,
                              borderColor: const Color(0xFFFCFCFC),
                              borderWidth: 0.0,
                              borderRadius: 8.0,
                              margin: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 4.0),
                              hidesUnderline: true,
                              isOverButton: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 200.0,
                        decoration: const BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FlutterFlowDropDown<String>(
                              controller: _model.priceTypeValueController ??=
                                  FormFieldController<String>(null),
                              options: const [
                                'Fixed',
                                'Per Unit',
                                'Minimum Price',
                                'Price Range',
                                'Included'
                              ],
                              onChanged: (val) =>
                                  setState(() => _model.priceTypeValue = val),
                              width: 90.0,
                              height: 30.0,
                              textStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              hintText: 'Price',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: const Color(0xFFFCFCFC),
                              elevation: 0.0,
                              borderColor: const Color(0xFFFCFCFC),
                              borderWidth: 0.0,
                              borderRadius: 8.0,
                              margin: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 4.0),
                              hidesUnderline: true,
                              isOverButton: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 4.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 4.0, 0.0),
                                        child: Container(
                                          width: 75.0,
                                          decoration: const BoxDecoration(),
                                          child: TextFormField(
                                            controller: _model.qtyController ??=
                                                TextEditingController(
                                              text: columnClientServicesRecord
                                                  .quantity
                                                  .toString(),
                                            ),
                                            focusNode: _model.qtyFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.qtyController',
                                              const Duration(milliseconds: 2000),
                                              () async {
                                                await columnClientServicesRecord
                                                    .reference
                                                    .update(
                                                        createClientServicesRecordData(
                                                  quantity: int.tryParse(_model
                                                      .qtyController.text),
                                                ));
                                                _model.clientServices =
                                                    await queryClientServicesRecordOnce(
                                                  queryBuilder:
                                                      (clientServicesRecord) =>
                                                          clientServicesRecord
                                                              .where(
                                                                'clientRef',
                                                                isEqualTo:
                                                                    columnClientServicesRecord
                                                                        .clientRef,
                                                              )
                                                              .where(
                                                                'type',
                                                                isEqualTo:
                                                                    'one_off',
                                                              ),
                                                );
                                                while (_model.clientServices!
                                                        .length >=
                                                    _model.serviceLoopCount) {
                                                  _model.serviceTotal =
                                                      await actions
                                                          .createSubTotal(
                                                    _model
                                                        .clientServices![_model
                                                            .serviceLoopCount]
                                                        .quantity,
                                                    _model
                                                        .clientServices![_model
                                                            .serviceLoopCount]
                                                        .price,
                                                  );
                                                  setState(() {
                                                    FFAppState()
                                                            .oneOffSubTotal =
                                                        (_model.serviceTotal!) +
                                                            FFAppState()
                                                                .oneOffSubTotal;
                                                  });
                                                  setState(() {
                                                    _model.serviceLoopCount =
                                                        _model.serviceLoopCount +
                                                            1;
                                                  });
                                                }
                                                _model.updatePage(() {
                                                  _model.serviceLoopCount = 0;
                                                });

                                                setState(() {});
                                              },
                                            ),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              hintText: 'QTY',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                            validator: _model
                                                .qtyControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 4.0, 0.0),
                                        child: Text(
                                          'X',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      4.0, 0.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 75.0,
                                        decoration: const BoxDecoration(),
                                        child: TextFormField(
                                          controller:
                                              _model.amountController ??=
                                                  TextEditingController(
                                            text: columnClientServicesRecord
                                                .price
                                                .toString(),
                                          ),
                                          focusNode: _model.amountFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.amountController',
                                            const Duration(milliseconds: 2000),
                                            () async {
                                              await columnClientServicesRecord
                                                  .reference
                                                  .update(
                                                      createClientServicesRecordData(
                                                quantity: int.tryParse(
                                                    _model.qtyController.text),
                                              ));
                                              _model.clientServicesCopy =
                                                  await queryClientServicesRecordOnce(
                                                queryBuilder:
                                                    (clientServicesRecord) =>
                                                        clientServicesRecord
                                                            .where(
                                                              'clientRef',
                                                              isEqualTo:
                                                                  columnClientServicesRecord
                                                                      .clientRef,
                                                            )
                                                            .where(
                                                              'type',
                                                              isEqualTo:
                                                                  'one_off',
                                                            ),
                                              );
                                              while (_model
                                                      .clientServices!.length >=
                                                  _model.serviceLoopCount) {
                                                _model.serviceTotalCopy =
                                                    await actions
                                                        .createSubTotal(
                                                  _model
                                                      .clientServices![_model
                                                          .serviceLoopCount]
                                                      .quantity,
                                                  _model
                                                      .clientServices![_model
                                                          .serviceLoopCount]
                                                      .price,
                                                );
                                                setState(() {
                                                  FFAppState().oneOffSubTotal =
                                                      (_model.serviceTotal!) +
                                                          FFAppState()
                                                              .oneOffSubTotal;
                                                });
                                                setState(() {
                                                  _model.serviceLoopCount =
                                                      _model.serviceLoopCount +
                                                          1;
                                                });
                                              }
                                              _model.updatePage(() {
                                                _model.serviceLoopCount = 0;
                                              });

                                              setState(() {});
                                            },
                                          ),
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            hintText: '\$',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          validator: _model
                                              .amountControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.dropDownValueController1 ??=
                                            FormFieldController<String>(
                                      _model.dropDownValue1 ??= 'Day',
                                    ),
                                    options: const [
                                      'Day',
                                      'Hour',
                                      'Employee',
                                      'Transaction',
                                      'Entity',
                                      'Person',
                                      'Bill',
                                      'Item'
                                    ],
                                    onChanged: (val) => setState(
                                        () => _model.dropDownValue1 = val),
                                    width: 100.0,
                                    height: 30.0,
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    hintText: 'Per hour',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: const Color(0xFFFCFCFC),
                                    elevation: 0.0,
                                    borderColor: const Color(0xFFFCFCFC),
                                    borderWidth: 0.0,
                                    borderRadius: 8.0,
                                    margin: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 8.0, 4.0),
                                    hidesUnderline: true,
                                    isOverButton: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 80.0,
                        decoration: const BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 0.0, 0.0),
                              child: FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController2 ??=
                                    FormFieldController<String>(null),
                                options: const ['Remove Service'],
                                onChanged: (val) =>
                                    setState(() => _model.dropDownValue2 = val),
                                width: 100.0,
                                height: 30.0,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                hintText: 'Action',
                                icon: FaIcon(
                                  FontAwesomeIcons.ellipsisV,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: const Color(0xFFFCFCFC),
                                elevation: 0.0,
                                borderColor: const Color(0xFFFCFCFC),
                                borderWidth: 0.0,
                                borderRadius: 8.0,
                                margin: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 8.0, 4.0),
                                hidesUnderline: true,
                                isOverButton: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Divider(
              height: 2.0,
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).secondary,
            ),
          ],
        );
      },
    );
  }
}
