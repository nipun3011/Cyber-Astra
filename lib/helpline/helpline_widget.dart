import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'helpline_model.dart';
export 'helpline_model.dart';

class HelplineWidget extends StatefulWidget {
  const HelplineWidget({Key? key}) : super(key: key);

  @override
  _HelplineWidgetState createState() => _HelplineWidgetState();
}

class _HelplineWidgetState extends State<HelplineWidget>
    with TickerProviderStateMixin {
  late HelplineModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 1190.ms,
          begin: Offset(0.0, -34.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HelplineModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
        backgroundColor: Color(0xFFDEF8FF),
        body: SafeArea(
          top: true,
          child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFDEF8FF), Color(0xFF59A8F5)],
                stops: [0.0, 1.0],
                begin: AlignmentDirectional(0.0, -1.0),
                end: AlignmentDirectional(0, 1.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 10.0),
              child: StreamBuilder<List<BanksRecord>>(
                stream: queryBanksRecord(
                  queryBuilder: (banksRecord) => banksRecord.where(
                    'Bank_Name',
                    isEqualTo: _model.banksValue,
                  ),
                  singleRecord: true,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 35.0,
                        height: 35.0,
                        child: SpinKitThreeBounce(
                          color: Color(0xFF1644E0),
                          size: 35.0,
                        ),
                      ),
                    );
                  }
                  List<BanksRecord> columnBanksRecordList = snapshot.data!;
                  final columnBanksRecord = columnBanksRecordList.isNotEmpty
                      ? columnBanksRecordList.first
                      : null;
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('HomePage');
                              },
                              child: Icon(
                                Icons.chevron_left_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 40.0,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'a8h7tgkz' /* Block your card to prevent fra... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Open Sans',
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ).animateOnPageLoad(
                                    animationsMap['textOnPageLoadAnimation']!),
                              ),
                              Icon(
                                Icons.settings_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 20.0),
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                'sj1dxohd' /* Enter your account number */,
                              ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Open Sans',
                                    fontSize: 14.0,
                                  ),
                              hintStyle:
                                  FlutterFlowTheme.of(context).titleMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF59A8F5),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: Color(0xFFDEF8FF),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: FlutterFlowDropDown<String>(
                            controller: _model.banksValueController ??=
                                FormFieldController<String>(null),
                            options: [
                              FFLocalizations.of(context).getText(
                                'zxha3y1v' /* Bank of Baroda */,
                              ),
                              FFLocalizations.of(context).getText(
                                '4ikv63e7' /* Canara Bank */,
                              ),
                              FFLocalizations.of(context).getText(
                                'wfermafl' /* Bank of India */,
                              ),
                              FFLocalizations.of(context).getText(
                                'cy17nzgh' /* Central Bank of India */,
                              ),
                              FFLocalizations.of(context).getText(
                                'sfftx4k3' /* Indian Bank */,
                              ),
                              FFLocalizations.of(context).getText(
                                'popcwe37' /* Indian Overseas Bank */,
                              ),
                              FFLocalizations.of(context).getText(
                                'l9sw1iar' /* Idfc First Bank Ltd */,
                              ),
                              FFLocalizations.of(context).getText(
                                'z6vd6k9r' /* Fino Payments Bank */,
                              ),
                              FFLocalizations.of(context).getText(
                                'ecvlydyq' /* Dbs Bank India Limited */,
                              )
                            ],
                            onChanged: (val) =>
                                setState(() => _model.banksValue = val),
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 50.0,
                            searchHintTextStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF2A2A2A),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            searchTextStyle:
                                FlutterFlowTheme.of(context).bodyMedium,
                            textStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            hintText: FFLocalizations.of(context).getText(
                              'e9lkm2v4' /* Which Bank to Report ? */,
                            ),
                            searchHintText: FFLocalizations.of(context).getText(
                              'di5z7fow' /* Search... */,
                            ),
                            searchCursorColor: Colors.black,
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Color(0xFF242424),
                              size: 24.0,
                            ),
                            fillColor: Color(0xFFDEF8FF),
                            elevation: 2.0,
                            borderColor: Color(0xFF59A8F5),
                            borderWidth: 1.0,
                            borderRadius: 8.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 16.0, 4.0),
                            hidesUnderline: true,
                            isOverButton: true,
                            isSearchable: true,
                            isMultiSelect: false,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (isiOS) {
                                    await launchUrl(Uri.parse(
                                        "sms:${columnBanksRecord!.number}&body=${Uri.encodeComponent(functions.newCustomFunction(_model.textController.text, _model.textController.text))}"));
                                  } else {
                                    await launchUrl(Uri(
                                      scheme: 'sms',
                                      path: columnBanksRecord!.number,
                                      queryParameters: <String, String>{
                                        'body': functions.newCustomFunction(
                                            _model.textController.text,
                                            _model.textController.text),
                                      },
                                    ));
                                  }
                                },
                                text: FFLocalizations.of(context).getText(
                                  'ci1lawng' /* Block */,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFFF21D6C),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Open Sans',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  elevation: 5.0,
                                  borderSide: BorderSide(
                                    color: Color(0xFFA90909),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'uz8uwvak' /* Beware this step will block yo... */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Open Sans',
                                  color: Color(0xFFA60505),
                                ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
