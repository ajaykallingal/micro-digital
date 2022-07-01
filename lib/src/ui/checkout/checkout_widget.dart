import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:micro_digital/app_state.dart';

import '../../data/bloc/cart_bloc.dart';
import '../../data/utils/screen_size/size_config.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

class CheckoutWidget extends StatefulWidget {
  const CheckoutWidget({Key? key}) : super(key: key);

  @override
  _CheckoutWidgetState createState() => _CheckoutWidgetState();
}

class _CheckoutWidgetState extends State<CheckoutWidget> {
  String? dropDownValue1;
  String? dropDownValue2;
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  TextEditingController? textController4;
  TextEditingController? textController5;
  String? dropDownValue3;
  String? dropDownValue4;
  TextEditingController? textController6;
  // final scaffoldKey = GlobalKey<ScaffoldState>();
  double _width = 0.0;
  double _height = 0.0;
  final cartBloc = CartBloc();
  String dropdownValue = 'malappuram';

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
    textController5 = TextEditingController();
    textController6 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    SizeConfig().init(context);
    return Scaffold(
        // key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: <Widget>[
            // The containers in the background and scrollable
            CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  // 3
                  expandedHeight: 100.0, automaticallyImplyLeading: false,
                  // 4
                  pinned: false,
                  elevation: 0,
                  // 5
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.only(left: 0, bottom: 0),
                    title: Container(
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'assets/images/TOP_BAR.png',
                            width: double.infinity,
                            height: 100,
                            fit: BoxFit.fill,
                          ).image,
                        ),
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                      ),
                      height: 100,
                      width: _width,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 20,
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                            Text(
                              'Checkout',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Titillium Web',
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            Container(
                              width: 30,
                              height: 0,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    collapseMode: CollapseMode.parallax,
                    // background: ImageWithTopShadowWidget(imagePath),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      // 7
                      child: Column(
                        children: [
                          // SizedBox(
                          //   height: _height * .20,
                          // ),
                          // SizedBox(
                          //   height: 80,
                          // ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Colors.black12,
                                    // color: Color(0xFF10000000),
                                    offset: Offset(0, 1),
                                    spreadRadius: 1,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Select your Location',
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Titillium Web',
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            value: dropdownValue,
                                            // iconSize: 15,
                                            iconDisabledColor: Colors.black,
                                            iconEnabledColor: Color(0xFF26ABE2),
                                            icon: Icon(
                                              Icons.arrow_drop_down_sharp,
                                            ),
                                            elevation: 16,
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                dropdownValue = newValue!;
                                              });
                                            },
                                            items: <String>[
                                              'palakkad',
                                              'trissur',
                                              'kozhikode',
                                              'malappuram'
                                            ].map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                                // alignment: Alignment.centerRight,
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      height: 1,
                                      thickness: 1,
                                      color: Color(0x19000000),
                                    ),
                                    // FlutterFlowDropDown(
                                    //   margin: EdgeInsetsDirectional.fromSTEB(
                                    //       0, 0, 0, 0),
                                    //   options: [
                                    //     'palakkad',
                                    //     'trissur',
                                    //     'kozhikode',
                                    //     'malappuram'
                                    //   ].toList(),
                                    //   onChanged: (val) =>
                                    //       setState(() => dropDownValue1 = val),
                                    //   width: 400,
                                    //   height: 50,
                                    //   textStyle: FlutterFlowTheme.of(context)
                                    //       .bodyText1
                                    //       .override(
                                    //         fontFamily: 'Titillium Web',
                                    //         color: Color(0xFF26ABE2),
                                    //       ),
                                    //   hintText: 'Please select...',
                                    //   icon: Icon(
                                    //     Icons.arrow_drop_down_sharp,
                                    //     color: Color(0xFF26ABE2),
                                    //     size: 15,
                                    //   ),
                                    //   fillColor: Colors.white,
                                    //   elevation: 2,
                                    //   borderColor: Colors.transparent,
                                    //   borderWidth: 0,
                                    //   borderRadius: 0,
                                    // ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: 'Get location from map',
                                        icon: Icon(
                                          Icons.my_location_outlined,
                                          size: 20,
                                        ),
                                        options: FFButtonOptions(
                                          width: 400,
                                          height: 40,
                                          color: Color(0xFF26ABE2),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Titillium Web',
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                  ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: 12,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: Text(
                                        'Collection Methods',
                                        style: FlutterFlowTheme.of(context)
                                            .title1
                                            .override(
                                              fontFamily: 'Titillium Web',
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    // FlutterFlowDropDown(
                                    //   options: [
                                    //     'palakkad',
                                    //     'trissur',
                                    //     'kozhikode',
                                    //     'malappuram'
                                    //   ].toList(),
                                    //   onChanged: (val) =>
                                    //       setState(() => dropDownValue2 = val),
                                    //   width: 400,
                                    //   height: 50,
                                    //   textStyle: FlutterFlowTheme.of(context)
                                    //       .bodyText1
                                    //       .override(
                                    //         fontFamily: 'Titillium Web',
                                    //         color: Color(0xFF26ABE2),
                                    //       ),
                                    //   hintText: 'Home collection',
                                    //   icon: Icon(
                                    //     Icons.arrow_drop_down_sharp,
                                    //     color: Color(0xFF26ABE2),
                                    //     size: 25,
                                    //   ),
                                    //   fillColor: Colors.white,
                                    //   elevation: 0,
                                    //   borderColor: Colors.transparent,
                                    //   borderWidth: 0,
                                    //   borderRadius: 0,
                                    //   margin: EdgeInsetsDirectional.fromSTEB(
                                    //       0, 0, 0, 0),
                                    // ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: Text(
                                        'Select collection date and time',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Titillium Web',
                                              color: Color(0x96101213),
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: Text(
                                        'Collection Date',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 5),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            FFAppState().dateSelected,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Titillium Web',
                                                  color: Color(0xFF6D6D6D),
                                                ),
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            color: Color(0xFF26ABE2),
                                            size: 25,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 1,
                                      thickness: 1,
                                      color: Color(0x19000000),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: Text(
                                        'Collection Time',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    '1:00',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Titillium Web',
                                                          color:
                                                              Color(0xFF6D6D6D),
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                5, 0, 0, 0),
                                                    child: SvgPicture.asset(
                                                      'assets/images/updown.svg',
                                                      width: 10,
                                                      height: 10,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 5, 0, 0),
                                                child: Container(
                                                  width: 100,
                                                  height: 1,
                                                  decoration: BoxDecoration(
                                                      // color: Color(0x1A000000),
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    35, 0, 35, 0),
                                            child: Icon(
                                              Icons.access_time_outlined,
                                              color: Color(0xFF26ABE2),
                                              size: 24,
                                            ),
                                          ),
                                          Flexible(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      '1:00',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Titillium Web',
                                                                color: Color(
                                                                    0xFF6D6D6D),
                                                              ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5, 0, 0, 0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/updown.svg',
                                                        width: 10,
                                                        height: 10,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 5, 0, 0),
                                                  child: Container(
                                                    width: 100,
                                                    height: 1,
                                                    decoration: BoxDecoration(
                                                        // color: Color(0x1A000000),
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: Text(
                                        'Minimum interval of collection time - 1 Hour',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Titillium Web',
                                              color: Color(0x98101213),
                                              fontSize: 12,
                                              fontStyle: FontStyle.italic,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: Text(
                                        'Contact information',
                                        style: FlutterFlowTheme.of(context)
                                            .title1
                                            .override(
                                              fontFamily: 'Titillium Web',
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 5, 0, 0),
                                      child: TextFormField(
                                        controller: textController1,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelText: 'First Name',
                                          hintText: 'First Name',
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              // color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          prefixIcon: Icon(
                                            Icons.person_outline_rounded,
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                        keyboardType: TextInputType.name,
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 1,
                                      decoration: BoxDecoration(
                                          // color: Color(0x19000000),
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 5, 0, 0),
                                      child: TextFormField(
                                        controller: textController2,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelText: 'Last Name',
                                          hintText: 'First Name',
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              // color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              // color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          prefixIcon: Icon(
                                            Icons.person_outline_rounded,
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                        keyboardType: TextInputType.name,
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 1,
                                      decoration: BoxDecoration(
                                          // color: Color(0x1A000000),
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 5, 0, 0),
                                      child: TextFormField(
                                        controller: textController3,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelText: 'Phone',
                                          hintText: 'First Name',
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              // color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              // color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          prefixIcon: Icon(
                                            Icons.phone_outlined,
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: Text(
                                        'Contact Address',
                                        style: FlutterFlowTheme.of(context)
                                            .title1
                                            .override(
                                              fontFamily: 'Titillium Web',
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 5, 0, 0),
                                      child: TextFormField(
                                        controller: textController4,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelText: 'Address',
                                          hintText: 'Address',
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              // color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              // color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          prefixIcon: Icon(
                                            Icons.location_history_outlined,
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                        maxLines: 1,
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 1,
                                      decoration: BoxDecoration(
                                          // color: Color(0x19000000),
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 5, 0, 0),
                                      child: TextFormField(
                                        controller: textController5,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelText: 'City',
                                          hintText: 'City',
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              // color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              // color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          prefixIcon: Icon(
                                            Icons.location_city,
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                        keyboardType: TextInputType.name,
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 1,
                                      decoration: BoxDecoration(
                                          // color: Color(0x3A000000),
                                          ),
                                    ),
                                    // FlutterFlowDropDown(
                                    //   margin: EdgeInsetsDirectional.fromSTEB(
                                    //       0, 0, 0, 0),
                                    //   initialOption: dropDownValue3 ??=
                                    //       'Country',
                                    //   options: [
                                    //     'India',
                                    //     'UAE',
                                    //     'Pakistan',
                                    //     'malappuram'
                                    //   ].toList(),
                                    //   onChanged: (val) =>
                                    //       setState(() => dropDownValue3 = val),
                                    //   width: 400,
                                    //   height: 50,
                                    //   textStyle: FlutterFlowTheme.of(context)
                                    //       .bodyText1
                                    //       .override(
                                    //         fontFamily: 'Titillium Web',
                                    //         color: Color(0xFF26ABE2),
                                    //       ),
                                    //   hintText: 'Country',
                                    //   icon: Icon(
                                    //     Icons.arrow_drop_down_sharp,
                                    //     color: Color(0xFF26ABE2),
                                    //     size: 25,
                                    //   ),
                                    //   fillColor: Colors.white,
                                    //   elevation: 0,
                                    //   borderColor: Colors.transparent,
                                    //   borderWidth: 0,
                                    //   borderRadius: 0,
                                    // ),
                                    // FlutterFlowDropDown(
                                    //   initialOption: dropDownValue4 ??=
                                    //       'Country',
                                    //   options: [
                                    //     'India',
                                    //     'UAE',
                                    //     'Pakistan',
                                    //     'malappuram'
                                    //   ].toList(),
                                    //   onChanged: (val) =>
                                    //       setState(() => dropDownValue4 = val),
                                    //   width: 400,
                                    //   height: 50,
                                    //   textStyle: FlutterFlowTheme.of(context)
                                    //       .bodyText1
                                    //       .override(
                                    //         fontFamily: 'Titillium Web',
                                    //         color: Color(0xFF26ABE2),
                                    //       ),
                                    //   hintText: 'State/Province',
                                    //   icon: Icon(
                                    //     Icons.arrow_drop_down_sharp,
                                    //     color: Color(0xFF26ABE2),
                                    //     size: 25,
                                    //   ),
                                    //   fillColor: Colors.white,
                                    //   elevation: 0,
                                    //   borderColor: Colors.transparent,
                                    //   borderWidth: 0,
                                    //   borderRadius: 0,
                                    //   margin: EdgeInsetsDirectional.fromSTEB(
                                    //       0, 0, 0, 0),
                                    // ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 5, 0, 0),
                                      child: TextFormField(
                                        controller: textController6,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelText: 'Zip/Postal code',
                                          hintText: 'Zip/Postal code',
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              // color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              // color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          prefixIcon: Icon(
                                            Icons.edit_location_outlined,
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                        keyboardType: TextInputType.name,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 70),
                        ],
                      ),
                    ),
                    childCount: 1,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                // height: 174,
                decoration: BoxDecoration(
                  color: Color(0xFF26ABE2),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, -15),
                      blurRadius: 20,
                      color: Color(0xFFDADADA).withOpacity(0.25),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF26ABE2),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 2,
                                offset: Offset(0, -2))
                          ],
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20))),
                      child: SafeArea(
                        top: false,
                        right: false,
                        bottom: true,
                        left: false,
                        child: Container(
                          decoration: BoxDecoration(
                              // color: Color(0x004B39EF),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20))),
                          width: MediaQuery.of(context).size.width,
                          // ignore: deprecated_member_use
                          child: FlatButton(
                            height: 50,
                            shape: RoundedRectangleBorder(
                              // borderRadius: BorderRadius.circular(20.0),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                            ),
                            // color: Color(0x004B39EF),
                            onPressed: () {
                              Navigator.pushNamed(context, '/checkout');
                            },
                            child: Text(
                              "Continue",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
