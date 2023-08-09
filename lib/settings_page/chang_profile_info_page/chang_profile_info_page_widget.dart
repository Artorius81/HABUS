import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'chang_profile_info_page_model.dart';
export 'chang_profile_info_page_model.dart';

class ChangProfileInfoPageWidget extends StatefulWidget {
  const ChangProfileInfoPageWidget({Key? key}) : super(key: key);

  @override
  _ChangProfileInfoPageWidgetState createState() =>
      _ChangProfileInfoPageWidgetState();
}

class _ChangProfileInfoPageWidgetState
    extends State<ChangProfileInfoPageWidget> {
  late ChangProfileInfoPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangProfileInfoPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: 20.0,
            borderWidth: 0.0,
            buttonSize: 40.0,
            fillColor: FlutterFlowTheme.of(context).primaryBackground,
            icon: Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed(
                'HomePage',
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            },
            child: GradientText(
              FFLocalizations.of(context).getText(
                'zdi6d13j' /* ХАБУС */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Open Sans',
                    fontSize: 36.0,
                    fontWeight: FontWeight.w900,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
                  ),
              colors: [
                FlutterFlowTheme.of(context).accent2,
                FlutterFlowTheme.of(context).accent1
              ],
              gradientDirection: GradientDirection.ttb,
              gradientType: GradientType.linear,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: 0.0,
                borderWidth: 0.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                icon: Icon(
                  Icons.notifications,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'zdc2przz' /* Информация об аккаунте */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'PT Sans',
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  's2z98gid' /* Измените основную информацию о... */,
                ),
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 12.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 64.0, 0.0, 0.0),
                child: Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '5inglpq7' /* Имя */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'PT Sans',
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                        child: FutureBuilder<List<ProfileRow>>(
                          future: ProfileTable().querySingleRow(
                            queryFn: (q) => q,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 24.0,
                                  height: 24.0,
                                  child: SpinKitCircle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                ),
                              );
                            }
                            List<ProfileRow> firstNameProfileRowList =
                                snapshot.data!;
                            final firstNameProfileRow =
                                firstNameProfileRowList.isNotEmpty
                                    ? firstNameProfileRowList.first
                                    : null;
                            return TextFormField(
                              controller: _model.firstNameController ??=
                                  TextEditingController(
                                text: firstNameProfileRow?.firstName,
                              ),
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.firstNameController',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              textCapitalization: TextCapitalization.sentences,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 14.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily),
                                    ),
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).accent1,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 0.0, 0.0),
                                suffixIcon: _model
                                        .firstNameController!.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.firstNameController?.clear();
                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                      )
                                    : null,
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              cursorColor: FlutterFlowTheme.of(context).accent1,
                              validator: _model.firstNameControllerValidator
                                  .asValidator(context),
                            );
                          },
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '37awu7da' /* Фамилия */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'PT Sans',
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                        child: FutureBuilder<List<ProfileRow>>(
                          future: ProfileTable().querySingleRow(
                            queryFn: (q) => q,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 24.0,
                                  height: 24.0,
                                  child: SpinKitCircle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                ),
                              );
                            }
                            List<ProfileRow> lastNameProfileRowList =
                                snapshot.data!;
                            final lastNameProfileRow =
                                lastNameProfileRowList.isNotEmpty
                                    ? lastNameProfileRowList.first
                                    : null;
                            return TextFormField(
                              controller: _model.lastNameController ??=
                                  TextEditingController(
                                text: lastNameProfileRow?.lastName,
                              ),
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.lastNameController',
                                Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              textCapitalization: TextCapitalization.sentences,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 14.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily),
                                    ),
                                hintText: lastNameProfileRow?.lastName,
                                hintStyle:
                                    FlutterFlowTheme.of(context).labelMedium,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).accent1,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 0.0, 0.0),
                                suffixIcon: _model
                                        .lastNameController!.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.lastNameController?.clear();
                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                      )
                                    : null,
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              cursorColor: FlutterFlowTheme.of(context).accent1,
                              validator: _model.lastNameControllerValidator
                                  .asValidator(context),
                            );
                          },
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'qxpvdk8k' /* Кафедра */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'PT Sans',
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                        child: FutureBuilder<List<ProfileRow>>(
                          future: ProfileTable().querySingleRow(
                            queryFn: (q) => q,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 24.0,
                                  height: 24.0,
                                  child: SpinKitCircle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                ),
                              );
                            }
                            List<ProfileRow> departmentChoiceProfileRowList =
                                snapshot.data!;
                            final departmentChoiceProfileRow =
                                departmentChoiceProfileRowList.isNotEmpty
                                    ? departmentChoiceProfileRowList.first
                                    : null;
                            return FlutterFlowDropDown<String>(
                              controller:
                                  _model.departmentChoiceValueController ??=
                                      FormFieldController<String>(
                                _model.departmentChoiceValue ??=
                                    valueOrDefault<String>(
                                  departmentChoiceProfileRow?.department,
                                  'Не указано',
                                ),
                              ),
                              options: [
                                FFLocalizations.of(context).getText(
                                  'uyr1c2k8' /* IT-колледж (IThub Владивосток)... */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'xwuvjlh1' /* Академический колледж  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'eob7zjrt' /* Высшая школа кино и телевидени... */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'sl5o3hcs' /* Институт заочного обучения  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'lo6ybbyf' /* Кафедра гражданско-правовых ди... */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'kujh28hf' /* Кафедра гуманитарных и социаль... */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'fshwew9p' /* Кафедра дизайна и технологий  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'ye3wtkcd' /* Кафедра информационной безопас... */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'ckbw7h0f' /* Кафедра информационных техноло... */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'hacfbfpz' /* Кафедра маркетинга и торговли  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '141q82r4' /* Кафедра математики и моделиров... */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'ypl77ukh' /* Кафедра международных отношени... */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '1mcjm60j' /* Кафедра межкультурных коммуник... */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '2u4t36ad' /* Кафедра русского языка  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'ho2zpekv' /* Кафедра теории и истории росси... */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'k6pa6otf' /* Кафедра транспортных процессов... */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'ul69w5tx' /* Кафедра туризма и гостинично-р... */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'prlr7bn1' /* Кафедра физкультурно-оздоровит... */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '8ktckca7' /* Кафедра философии и юридическо... */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '17m55lta' /* Кафедра экономики и управления... */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'a5j6hrst' /* Колледж индустрии моды и красо... */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'u5qwe4q5' /* Колледж сервиса и дизайна   */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'jofkwnz6' /* Отделение специальностей средн... */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'yb66dvzd' /* Отделение среднего профессиона... */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'vbbp3oos' /* Педагогический институт  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'e8avhhuw' /* Филиал ФГБОУ ВО "ВВГУ" в г. Ус... */,
                                )
                              ],
                              onChanged: (val) => setState(
                                  () => _model.departmentChoiceValue = val),
                              width: double.infinity,
                              height: 50.0,
                              searchHintTextStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    color: FlutterFlowTheme.of(context).accent1,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelMediumFamily),
                                  ),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: Colors.white,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                              hintText: FFLocalizations.of(context).getText(
                                '8e2tf3a3' /* Выберите кафедру */,
                              ),
                              searchHintText:
                                  FFLocalizations.of(context).getText(
                                'nkfofutc' /* Найти... */,
                              ),
                              searchCursorColor:
                                  FlutterFlowTheme.of(context).accent1,
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context).accent1,
                              elevation: 2.0,
                              borderColor: Colors.transparent,
                              borderWidth: 0.0,
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 16.0, 4.0),
                              hidesUnderline: true,
                              isSearchable: true,
                            );
                          },
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'vkdo3dkg' /* Группа */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'PT Sans',
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                        child: FutureBuilder<List<ProfileRow>>(
                          future: ProfileTable().querySingleRow(
                            queryFn: (q) => q,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 24.0,
                                  height: 24.0,
                                  child: SpinKitCircle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                ),
                              );
                            }
                            List<ProfileRow> groupChoiceProfileRowList =
                                snapshot.data!;
                            final groupChoiceProfileRow =
                                groupChoiceProfileRowList.isNotEmpty
                                    ? groupChoiceProfileRowList.first
                                    : null;
                            return FlutterFlowDropDown<String>(
                              controller: _model.groupChoiceValueController ??=
                                  FormFieldController<String>(
                                _model.groupChoiceValue ??=
                                    valueOrDefault<String>(
                                  groupChoiceProfileRow?.group,
                                  'Не указано',
                                ),
                              ),
                              options: [
                                FFLocalizations.of(context).getText(
                                  '9kp7m4e2' /* IT-СИП-22-В1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'bx38i0x2' /* IT-СИП-22-П1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'zagu4ql4' /* IT-СИП-23-В1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'x65zq3wk' /* IT-СИП-23-П1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '1nkb87z7' /* IT-СОИП-22-В1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'goe0rvhx' /* IT-СОИП-22-П1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'wedipl5a' /* IT-СОИП-23-В1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '4rembx6s' /* IT-СОИП-23-П1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'o0ewj005' /* А/БПИ-20-ПЭ1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'g7k7jcbi' /* А/БСС-20-СА1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'pza402kk' /* А/ВБСС-19  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'ltsi6xiw' /* А/ЗБМН-19  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'dg1wjd7m' /* А/ЗБМН-20  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'wxxdmgjh' /* А/ЗБЭМ-20  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'pi9yql0l' /* А/ЗБЭУ-19  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '71n9iw8z' /* А/ЗКМ(9)-20-01  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '2qvrnx66' /* А/ЗСКМ-21  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'j2ci1pbp' /* А/ЗСКМ-22-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'punnihxp' /* А/ЗСОКМ-21  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'dt3w3ck8' /* А/ЗСОКМ-22-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'szxw1whh' /* А/ЗССО-21  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'xefgxan5' /* А/ЗССО-22-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'ys7ctxfj' /* А/ЗСТ(9)-19-01  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'zlbl45uz' /* А/ЗСТ-19-01  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'ihx5ynxl' /* А/ЗСТ-20-01  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'm1bzxuk5' /* А/ЗСЭЗ(9)-19-01  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '2wyrzzkt' /* А/ЗСЭЗ-20-01  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'n556j80h' /* А/ЗЭБУ(9)-19-01  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'sjbkkm56' /* А/ПК(9)-20-01  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'c4e4os48' /* А/ПСО(9)-20-01  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'jkt7iw03' /* А/РК(9)-20-01  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'xw03d4ud' /* А/СОГД-22-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '04d4jnnt' /* А/СОКМ-22-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'v1n2l1bk' /* А/СООП-22-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'g13xhdzb' /* А/СОПД-22-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'vv8tcdku' /* А/СОПИ-21-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'dut7r94l' /* А/СОПИ-22-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'y4h8lj1b' /* А/СОПИ-22-2  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'yi3xmj12' /* А/СОПИ-23-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'wipp7qxn' /* А/СОПН-22-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'za8fs4ki' /* А/СОРД-21-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'ip386k83' /* А/СОРД-22-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'j818qyje' /* А/СОРД-23-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'hsn6997f' /* А/СОРК-21-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'eks1jllr' /* А/СОРК-22-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '6hx34fc9' /* А/СОРК-23-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '67s7w7pg' /* А/СОСА-22-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'dc0seyio' /* А/СОСА-23-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'nfbx68rw' /* А/СОСО-21-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'baoziujk' /* А/СОСО-22-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'nb6mit3v' /* А/СОСЭ-21-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'hsj7sl12' /* А/СОСЭ-22-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'ojqc93uk' /* А/СОСЭ-22-2  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'c6ixruv8' /* А/СОТГ-23-ТУ1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'aqq4ddo8' /* А/СОТУ-22-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'z5z2d96c' /* А/СОФЗ-22-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'mynzasou' /* А/СОЭБ-21  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'yl645euc' /* А/СПИ-21-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'f7twrsnn' /* А/СПИ-22-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'eeymv00m' /* А/СРД-22-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '13zec5qy' /* А/СРК-21-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '94xcpjfm' /* А/СРК-22-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'mjrpqueg' /* А/ССО-21-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '0irwgi8f' /* А/ССО-22-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '2mygqbhf' /* А/ССЭ-21-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'fpm61b8r' /* А/ССЭ-22-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '2atgd5mx' /* А/СТ(9)-20-01  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'fvvc2qnv' /* А/СЭБ-21-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'bktzcuqt' /* А/СЭБ-22-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '21af41yo' /* А/СЭЗ(9)-20-01  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'v11dl0nq' /* А/ЭБУ(9)-20-01  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'nl7kbqz3' /* АМЕН-22-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '67huk6y4' /* АМЕН-23-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'bdsouhzh' /* АМНО-22-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '8elt5rmv' /* АМПО-22-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'p7vefzdl' /* АМСИ-22-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'hec2u3yo' /* АПИП-22-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '6eqb7a2e' /* АПНР-20  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '5dn9035k' /* АПНР-21-МОП1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'wyj4uxfw' /* АППН-22-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'l02rk77b' /* АППН-23-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  't3re7n7o' /* АРОЭ-22-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'fyox77vg' /* АРОЭ-22-2  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'vpaesem8' /* АРОЭ-23-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '7snrk7vp' /* АСАУ-22-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'g32gdw39' /* АТИК-22-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'dyffhbjz' /* АТИП-22-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  't6e6w6ds' /* АТИП-23-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'hms0vavn' /* АЭИУ-20-ЭУ  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'oc6hq5e6' /* АЭУН-21-ЭК1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '4g3j4qv9' /* АЮРП-20  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '982pnswi' /* АЮРП-21-ТИП1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'wem9nctg' /* БАПС-19-01  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '3ypeym34' /* БАПС-20-01  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'mas2qnc3' /* ББИ-19-01  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'tjk0m0ni' /* ББИ-20-01  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'gtncs200' /* ББИ-21-БА1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'ulixm5rk' /* ББИ-22-БА1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'oz3yzqz2' /* ББИ-23-БА1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '719bvybi' /* БГУ-19-01  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'x4b4nd43' /* БПМ-21-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '7iczqpc0' /* БПМ-22-1  */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '8peiryiw' /* БПМ-20-01  */,
                                )
                              ],
                              onChanged: (val) =>
                                  setState(() => _model.groupChoiceValue = val),
                              width: double.infinity,
                              height: 50.0,
                              searchHintTextStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelMediumFamily),
                                  ),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: Colors.white,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                              hintText: FFLocalizations.of(context).getText(
                                'u0j92vgf' /* Выберите группу */,
                              ),
                              searchHintText:
                                  FFLocalizations.of(context).getText(
                                'dkjupltd' /* Найти... */,
                              ),
                              searchCursorColor:
                                  FlutterFlowTheme.of(context).accent1,
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context).accent1,
                              elevation: 2.0,
                              borderColor: Colors.transparent,
                              borderWidth: 0.0,
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 16.0, 4.0),
                              hidesUnderline: true,
                              isSearchable: true,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (_model.formKey.currentState == null ||
                          !_model.formKey.currentState!.validate()) {
                        return;
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Сохранено!',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                          duration: Duration(milliseconds: 2000),
                          backgroundColor: FlutterFlowTheme.of(context).success,
                        ),
                      );
                      await ProfileTable().update(
                        data: {
                          'group': _model.groupChoiceValue,
                          'department': _model.departmentChoiceValue,
                          'first_name': _model.firstNameController.text,
                          'last_name': _model.lastNameController.text,
                        },
                        matchingRows: (rows) => rows.eq(
                          'id',
                          currentUserUid,
                        ),
                      );
                      context.safePop();
                    },
                    text: FFLocalizations.of(context).getText(
                      'zzfra36q' /* Сохранить */,
                    ),
                    options: FFButtonOptions(
                      width: 200.0,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).accent1,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily: 'Open Sans',
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleSmallFamily),
                          ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        width: 0.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
