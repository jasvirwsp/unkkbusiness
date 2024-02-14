import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'onboard_one_off_services_type_bill_model.dart';
export 'onboard_one_off_services_type_bill_model.dart';

class OnboardOneOffServicesTypeBillWidget extends StatefulWidget {
  const OnboardOneOffServicesTypeBillWidget({
    super.key,
    this.serviceRef,
    this.proposalRef,
    this.serviceType,
  });

  final DocumentReference? serviceRef;
  final ProposalRecord? proposalRef;
  final String? serviceType;

  @override
  State<OnboardOneOffServicesTypeBillWidget> createState() =>
      _OnboardOneOffServicesTypeBillWidgetState();
}

class _OnboardOneOffServicesTypeBillWidgetState
    extends State<OnboardOneOffServicesTypeBillWidget> {
  late OnboardOneOffServicesTypeBillModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardOneOffServicesTypeBillModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(82.0, 70.0, 82.0, 70.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 56.0,
                          height: 56.0,
                          decoration: BoxDecoration(
                            color: const Color(0x33EEEEEE),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).secondary,
                              width: 1.0,
                            ),
                          ),
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: FaIcon(
                            FontAwesomeIcons.arrowLeft,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 28.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Send Proposal to ${widget.proposalRef?.firstName} ${widget.proposalRef?.lastName}',
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 206.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 16.0),
                                child: Text(
                                  'How will this one-off service be billed?',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.userProposal =
                                              await ProposalRecord
                                                  .getDocumentOnce(widget
                                                      .proposalRef!.reference);
                                          _model.clientExist =
                                              await queryClientsRecordOnce(
                                            queryBuilder: (clientsRecord) =>
                                                clientsRecord.where(
                                              'email',
                                              isEqualTo:
                                                  _model.userProposal?.email,
                                            ),
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);
                                          if (_model.clientExist?.email !=
                                              widget.proposalRef?.email) {
                                            var clientsRecordReference =
                                                ClientsRecord.collection.doc();
                                            await clientsRecordReference.set({
                                              ...createClientsRecordData(
                                                firstName: widget
                                                    .proposalRef?.firstName,
                                                lastName: widget
                                                    .proposalRef?.lastName,
                                                dateOfBirth: widget
                                                    .proposalRef?.dateOfBirth,
                                                email:
                                                    widget.proposalRef?.email,
                                                proposalRef: widget
                                                    .proposalRef?.reference,
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'createdAt': FieldValue
                                                      .serverTimestamp(),
                                                },
                                              ),
                                            });
                                            _model.clientInfo = ClientsRecord
                                                .getDocumentFromData({
                                              ...createClientsRecordData(
                                                firstName: widget
                                                    .proposalRef?.firstName,
                                                lastName: widget
                                                    .proposalRef?.lastName,
                                                dateOfBirth: widget
                                                    .proposalRef?.dateOfBirth,
                                                email:
                                                    widget.proposalRef?.email,
                                                proposalRef: widget
                                                    .proposalRef?.reference,
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'createdAt': DateTime.now(),
                                                },
                                              ),
                                            }, clientsRecordReference);

                                            await ClientServicesRecord
                                                .collection
                                                .doc()
                                                .set(
                                                    createClientServicesRecordData(
                                                  type: widget.serviceType,
                                                  billingMode: 'on_acceptance',
                                                  clientRef: _model
                                                      .clientInfo?.reference,
                                                  serviceRef: widget.serviceRef,
                                                  quantity: 1,
                                                  price: 0.0,
                                                ));

                                            context.pushNamed(
                                              'onboardOneOffServicesList',
                                              queryParameters: {
                                                'clientRef': serializeParam(
                                                  _model.clientInfo?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                                'proposalRef': serializeParam(
                                                  widget.proposalRef,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'proposalRef':
                                                    widget.proposalRef,
                                              },
                                            );
                                          } else {
                                            await ClientServicesRecord
                                                .collection
                                                .doc()
                                                .set(
                                                    createClientServicesRecordData(
                                                  type: widget.serviceType,
                                                  billingMode: 'on_acceptance',
                                                  clientRef: _model
                                                      .clientExist?.reference,
                                                  serviceRef: widget.serviceRef,
                                                  quantity: 1,
                                                  price: 0.0,
                                                ));

                                            context.pushNamed(
                                              'onboardOneOffServicesList',
                                              queryParameters: {
                                                'clientRef': serializeParam(
                                                  _model.clientExist?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                                'proposalRef': serializeParam(
                                                  widget.proposalRef,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'proposalRef':
                                                    widget.proposalRef,
                                              },
                                            );
                                          }

                                          setState(() {});
                                        },
                                        child: Container(
                                          width: 238.0,
                                          decoration: const BoxDecoration(
                                            color: Color(0x1904F5C8),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10.0),
                                              bottomRight:
                                                  Radius.circular(10.0),
                                              topLeft: Radius.circular(10.0),
                                              topRight: Radius.circular(10.0),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 40.0, 24.0, 40.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: Image.asset(
                                                    'assets/images/Group_289687.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 32.0, 0.0, 0.0),
                                                  child: Text(
                                                    'On acceptance',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  'Bill upon Proposal Acceptance',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Container(
                                        width: 238.0,
                                        decoration: BoxDecoration(
                                          color: const Color(0x1904F5C8),
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(10.0),
                                            bottomRight: Radius.circular(10.0),
                                            topLeft: Radius.circular(10.0),
                                            topRight: Radius.circular(10.0),
                                          ),
                                          border: Border.all(
                                            color: const Color(0x1A04F5C8),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 40.0, 24.0, 40.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: Image.asset(
                                                  'assets/images/g147.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 32.0, 0.0, 0.0),
                                                child: Text(
                                                  'On completion',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                ),
                                              ),
                                              Text(
                                                'Manual Billing upon Completion',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
