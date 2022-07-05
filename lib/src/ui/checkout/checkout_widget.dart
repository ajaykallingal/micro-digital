import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:micro_digital/src/data/bloc/order_bloc.dart';
import 'package:micro_digital/src/data/model/profile/list_my_profile/list_my_profile_response.dart';

import '../../common/styles.dart';
import '../../data/bloc/cart_bloc.dart';
import '../../data/bloc/profile_bloc.dart';
import '../../data/model/cart/add_to_cart_response.dart';
import '../../data/model/checkout/checkout_Order_Request.dart';
import '../../data/model/checkout/checkout_Order_Response.dart';
import '../../data/utils/screen_size/size_config.dart';
import '../flutter_flow/flutter_flow_theme.dart';
// import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

class CheckoutWidget extends StatefulWidget {
  const CheckoutWidget({Key? key}) : super(key: key);
  // static final kInitialPosition = LatLng(10.850516, 76.271080);

  @override
  _CheckoutWidgetState createState() => _CheckoutWidgetState();
}

class _CheckoutWidgetState extends State<CheckoutWidget> {
  String? dropDownValue1;
  String? dropDownValue2;
  TextEditingController? locationController;
  TextEditingController? collectionMethodController;
  TextEditingController? collectionDateController;
  // TextEditingController? collectionDateController;
  TextEditingController? firstNameController;
  TextEditingController? lastNameController;
  TextEditingController? phoneNumberController;
  TextEditingController? addressController;
  TextEditingController? cityController;
  TextEditingController? zipCodeController;
  TextEditingController? countryController;
  TextEditingController? stateController;

  String? dropDownValue3;
  String? dropDownValue4;
  TextEditingController dobController = TextEditingController();
  // final scaffoldKey = GlobalKey<ScaffoldState>();
  double _width = 0.0;
  double _height = 0.0;
  String googleMapApiKey = "AIzaSyAGvLnYX7JSQMbLk9g8rkouEZr9tPop17o";
  String dropdownValueLocation = 'malappuram';
  String dropdownValueCollectionMethod = 'Home collection';
  String dropdownValueCollectionTime1 = '7:00';
  String dropdownValueCollectionTime2 = '7:00';

  final cartBloc = CartBloc();
  final orderBloc = OrderBloc();
  final profileBloc = ProfileBloc();
  AddToCartResponse? listCartItems;
  bool loading = false;
  CheckoutOrderResponse? orderResponse;
  ListMyProfileResponse? listMyProfileResponse;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cartBloc.listCartSCListener.listen((event) {
      if (mounted) {
        setState(() {
          // cartList = event.cartList;
          listCartItems = event;

          // brandList =event.b;
          // recommendedPackageList = event.r
        });
      }
    });
    orderBloc.checkoutOrderSCListener.listen((event) {
      orderResponse = event;
    });
  }

  @override
  void initState() {
    super.initState();
    cartBloc.getCartList(203);
    locationController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneNumberController = TextEditingController();
    addressController = TextEditingController();
    cityController = TextEditingController();
    zipCodeController = TextEditingController();
    countryController = TextEditingController();
    stateController = TextEditingController();
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
                      child: listCartItems != null
                          ? Column(
                              children: [
                                // SizedBox(
                                //   height: _height * .20,
                                // ),
                                // SizedBox(
                                //   height: 80,
                                // ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 20, 20, 0),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              DropdownButtonHideUnderline(
                                                child: DropdownButton<String>(
                                                  value: dropdownValueLocation,
                                                  // iconSize: 15,
                                                  iconDisabledColor:
                                                      Colors.black,
                                                  iconEnabledColor:
                                                      Color(0xFF26ABE2),
                                                  icon: Icon(
                                                    Icons.arrow_drop_down_sharp,
                                                  ),
                                                  elevation: 16,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                  onChanged: (String?
                                                      newLocationValue) {
                                                    setState(() {
                                                      dropdownValueLocation =
                                                          newLocationValue!;
                                                    });
                                                  },
                                                  items: <String>[
                                                    'palakkad',
                                                    'trissur',
                                                    'kozhikode',
                                                    'malappuram'
                                                  ].map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                    return DropdownMenuItem<
                                                            String>(
                                                        value: value,
                                                        child: Text(value)
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
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 20, 0, 0),
                                            child: FFButtonWidget(
                                              onPressed: () {
                                                print('Button pressed ...');
                                                // Navigator.push(
                                                //   context,
                                                //   MaterialPageRoute(
                                                //     builder: (context) =>
                                                //         PlacePicker(
                                                //       apiKey:
                                                //           googleMapApiKey, // Put YOUR OWN KEY here.
                                                //       onPlacePicked: (result) {
                                                //         print(result.name);
                                                //         Navigator.of(context)
                                                //             .pop();
                                                //       },
                                                //
                                                //       useCurrentLocation: true,
                                                //       initialPosition:
                                                //           CheckoutWidget
                                                //               .kInitialPosition,
                                                //     ),
                                                //   ),
                                                // );
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
                                                          fontFamily:
                                                              'Titillium Web',
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 20, 0, 0),
                                            child: Text(
                                              'Collection Methods',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .title1
                                                  .override(
                                                    fontFamily: 'Titillium Web',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              DropdownButtonHideUnderline(
                                                child: DropdownButton<String>(
                                                  value:
                                                      dropdownValueCollectionMethod,
                                                  // iconSize: 15,
                                                  iconDisabledColor:
                                                      Colors.black,
                                                  iconEnabledColor:
                                                      Color(0xFF26ABE2),
                                                  icon: Icon(
                                                    Icons.arrow_drop_down_sharp,
                                                  ),
                                                  elevation: 16,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                  onChanged: (String?
                                                      newCollectionMethodValue) {
                                                    setState(() {
                                                      dropdownValueCollectionMethod =
                                                          newCollectionMethodValue!;
                                                    });
                                                  },
                                                  items: <String>[
                                                    'Home collection',
                                                    'tris',
                                                    'kokode',
                                                    'mala'
                                                  ].map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
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
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: Text(
                                              'Select collection date and time',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Titillium Web',
                                                    color: Color(0x96101213),
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: Text(
                                              'Collection Date',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Flexible(
                                                  child: buildDobSelector(
                                                      textEditingController:
                                                          dobController)),
                                            ],
                                          ),
                                          Divider(
                                            height: 1,
                                            thickness: 1,
                                            color: Color(0x19000000),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 20, 0, 0),
                                            child: Text(
                                              'Collection Time',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        DropdownButtonHideUnderline(
                                                          child: DropdownButton<
                                                              String>(
                                                            value:
                                                                dropdownValueCollectionTime1,
                                                            // iconSize: 15,
                                                            iconDisabledColor:
                                                                Colors.black,
                                                            iconEnabledColor:
                                                                Color(
                                                                    0xFF26ABE2),
                                                            icon: SvgPicture
                                                                .asset(
                                                              'assets/images/updown.svg',
                                                              width: 10,
                                                              height: 10,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                            elevation: 16,
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                            onChanged: (String?
                                                                newCollectionTimeValue1) {
                                                              setState(() {
                                                                dropdownValueCollectionTime1 =
                                                                    newCollectionTimeValue1!;
                                                              });
                                                            },
                                                            items: <String>[
                                                              '7:00',
                                                              '8:00',
                                                              '9:00',
                                                              '10:00',
                                                            ].map<
                                                                DropdownMenuItem<
                                                                    String>>((String
                                                                value) {
                                                              return DropdownMenuItem<
                                                                  String>(
                                                                value: value,
                                                                child:
                                                                    Text(value),
                                                                // alignment: Alignment.centerRight,
                                                              );
                                                            }).toList(),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 5, 0, 0),
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(35, 0, 35, 0),
                                                  child: Icon(
                                                    Icons.access_time_outlined,
                                                    color: Color(0xFF26ABE2),
                                                    size: 24,
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          DropdownButtonHideUnderline(
                                                            child:
                                                                DropdownButton<
                                                                    String>(
                                                              value:
                                                                  dropdownValueCollectionTime2,
                                                              // iconSize: 15,
                                                              iconDisabledColor:
                                                                  Colors.black,
                                                              iconEnabledColor:
                                                                  Color(
                                                                      0xFF26ABE2),
                                                              icon: SvgPicture
                                                                  .asset(
                                                                'assets/images/updown.svg',
                                                                width: 10,
                                                                height: 10,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                              elevation: 16,
                                                              style:
                                                                  const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                              onChanged: (String?
                                                                  newCollectionTimeValue2) {
                                                                setState(() {
                                                                  dropdownValueCollectionTime2 =
                                                                      newCollectionTimeValue2!;
                                                                });
                                                              },
                                                              items: <String>[
                                                                '7:00',
                                                                '8:00',
                                                                '9:00',
                                                                '10:00',
                                                              ].map<
                                                                  DropdownMenuItem<
                                                                      String>>((String
                                                                  value) {
                                                                return DropdownMenuItem<
                                                                    String>(
                                                                  value: value,
                                                                  child: Text(
                                                                      value),
                                                                  // alignment: Alignment.centerRight,
                                                                );
                                                              }).toList(),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 5, 0, 0),
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 20, 0, 0),
                                            child: Text(
                                              'Minimum interval of collection time - 1 Hour',
                                              style: FlutterFlowTheme.of(
                                                      context)
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 20, 0, 0),
                                            child: Text(
                                              'Contact information',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .title1
                                                  .override(
                                                    fontFamily: 'Titillium Web',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Text(
                                                'First name',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Flexible(
                                                child: Padding(
                                                  padding: EdgeInsets.zero,
                                                  child: TextField(
                                                    controller:
                                                        firstNameController,
                                                    decoration: InputDecoration(
                                                      constraints:
                                                          BoxConstraints(
                                                        maxHeight: 25,
                                                        maxWidth:
                                                            double.infinity,
                                                      ),
                                                      label: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text("Name")
                                                        ],
                                                      ),
                                                      border: InputBorder.none,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            height: 1,
                                            thickness: 1,
                                            color: Color(0x19000000),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Text(
                                                'Last name',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Flexible(
                                                child: Padding(
                                                  padding: EdgeInsets.zero,
                                                  child: TextField(
                                                    controller:
                                                        lastNameController,
                                                    decoration: InputDecoration(
                                                      label: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text("Name")
                                                        ],
                                                      ),
                                                      constraints:
                                                          BoxConstraints(
                                                        maxHeight: 25,
                                                        maxWidth:
                                                            double.infinity,
                                                      ),
                                                      border: InputBorder.none,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            height: 1,
                                            thickness: 1,
                                            color: Color(0x19000000),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Text(
                                                'Phone',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Flexible(
                                                child: Padding(
                                                  padding: EdgeInsets.zero,
                                                  child: TextField(
                                                    controller:
                                                        phoneNumberController,
                                                    decoration: InputDecoration(
                                                      constraints:
                                                          BoxConstraints(
                                                        maxHeight: 25,
                                                        maxWidth:
                                                            double.infinity,
                                                      ),
                                                      border: InputBorder.none,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            height: 1,
                                            thickness: 1,
                                            color: Color(0x19000000),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 20, 0, 0),
                                            child: Text(
                                              'Contact Address',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .title1
                                                  .override(
                                                    fontFamily: 'Titillium Web',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Text(
                                                'Address',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Flexible(
                                                child: Padding(
                                                  padding: EdgeInsets.zero,
                                                  child: TextField(
                                                    controller:
                                                        addressController,
                                                    maxLines: 6,
                                                    decoration: InputDecoration(
                                                      // constraints:
                                                      //     BoxConstraints(
                                                      //   maxHeight: 5,
                                                      //   maxWidth:
                                                      //       double.infinity,
                                                      // ),
                                                      border: InputBorder.none,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            height: 1,
                                            thickness: 1,
                                            color: Color(0x19000000),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Text(
                                                'City',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Flexible(
                                                child: Padding(
                                                  padding: EdgeInsets.zero,
                                                  child: TextField(
                                                    controller: cityController,
                                                    decoration: InputDecoration(
                                                      constraints:
                                                          BoxConstraints(
                                                        maxHeight: 25,
                                                        maxWidth:
                                                            double.infinity,
                                                      ),
                                                      border: InputBorder.none,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            height: 1,
                                            thickness: 1,
                                            color: Color(0x19000000),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Text(
                                                'Country',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Flexible(
                                                child: Padding(
                                                  padding: EdgeInsets.zero,
                                                  child: TextField(
                                                    controller:
                                                        countryController,
                                                    decoration: InputDecoration(
                                                      constraints:
                                                          BoxConstraints(
                                                        maxHeight: 25,
                                                        maxWidth:
                                                            double.infinity,
                                                      ),
                                                      border: InputBorder.none,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            height: 1,
                                            thickness: 1,
                                            color: Color(0x19000000),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Text(
                                                'State/Province',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Flexible(
                                                child: Padding(
                                                  padding: EdgeInsets.zero,
                                                  child: TextField(
                                                    controller: stateController,
                                                    decoration: InputDecoration(
                                                      constraints:
                                                          BoxConstraints(
                                                        maxHeight: 25,
                                                        maxWidth:
                                                            double.infinity,
                                                      ),
                                                      border: InputBorder.none,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            height: 1,
                                            thickness: 1,
                                            color: Color(0x19000000),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Text(
                                                'Zip/Postal code',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Flexible(
                                                child: Padding(
                                                  padding: EdgeInsets.zero,
                                                  child: TextField(
                                                    controller:
                                                        zipCodeController,
                                                    decoration: InputDecoration(
                                                      constraints:
                                                          BoxConstraints(
                                                        maxHeight: 25,
                                                        maxWidth:
                                                            double.infinity,
                                                      ),
                                                      border: InputBorder.none,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            height: 1,
                                            thickness: 1,
                                            color: Color(0x19000000),
                                          ),
                                          SizedBox(height: 50),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                // SizedBox(height: 70),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 20, 20, 0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 175,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 13,
                                          color: Color(0x2C000000),
                                          offset: Offset(0, 1),
                                          spreadRadius: 1,
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: ListView.builder(
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 20, 20, 0),
                                          child: Container(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      listCartItems!
                                                          .cartList![index]
                                                          .product,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Titillium Web',
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                    Text(
                                                      listCartItems!
                                                          .cartList![index]
                                                          .amount,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Titillium Web',
                                                            color: Colors.black,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      listCartItems!
                                                          .cartList![index]
                                                          .price,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Titillium Web',
                                                            color: Color(
                                                                0xFFAAAAAA),
                                                            fontSize: 21,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                    SizedBox(width: 10),
                                                    Text(
                                                      listCartItems!
                                                          .cartList![index]
                                                          .amount,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Titillium Web',
                                                            color: Color(
                                                                0xFF9AC12B),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount:
                                          listCartItems!.cartList!.length,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 60),
                              ],
                            )
                          : Center(
                              child: RefreshProgressIndicator(
                                color: mainBlueShade,
                                backgroundColor: Colors.white,
                              ),
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
                              orderBloc.checkoutOrder(
                                request: CheckoutOrderRequest(
                                  userPayLoad: UserPayLoad(
                                    userId: "203",
                                    shippingId: "6",
                                    paymentId: "6",
                                    profileId: "989",
                                    total: "99",
                                    firstname:
                                        firstNameController!.text.toString(),
                                    lastname:
                                        lastNameController!.text.toString(),
                                    sAddress:
                                        addressController!.text.toString(),
                                    sCity: dropdownValueLocation,
                                    sState: stateController!.text.toString(),
                                    sCountry:
                                        countryController!.text.toString(),
                                    sZipcode:
                                        zipCodeController!.text.toString(),
                                    phone:
                                        phoneNumberController!.text.toString(),
                                    email: "email",
                                    notes: "notes",
                                    deliveryDate: dobController.text.toString(),
                                    deliveryTimeFrom: "deliveryTimeFrom",
                                    deliveryTimeTo: "deliveryTimeTo",
                                  ),
                                ),
                              );
                              setState(() {
                                // Navigator.pushNamed(context, '/payment');
                              });
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

  Widget buildDobSelector({
    required TextEditingController textEditingController,
    // required String dropDownName,
  }) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        FocusManager.instance.primaryFocus?.unfocus();
        DatePicker.showDatePicker(
          context,
          showTitleActions: true,
          minTime: DateTime(1900, 1, 1),
          maxTime: DateTime.now(),
          theme: const DatePickerTheme(
              // headerColor: AppColors.buttonColor,
              backgroundColor: Colors.white,
              itemStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
              doneStyle: TextStyle(color: Colors.black87, fontSize: 16)),
          onChanged: (date) {},
          onConfirm: (date) {
            setState(() {
              dobController.text = DateFormat('yyyy-MM-dd').format(date);
              // _dobController.text = date.toString();
            });
          },
          currentTime: DateTime.now(),
        );
      },
      child: TextField(
        style: const TextStyle(color: Colors.black),
        // readOnly:  isReadOnly,
        controller: textEditingController,
        enabled: false,
        decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: Image.asset(
              "assets/icons/calendar 2.png",
              scale: 2.5,
            )
            // contentPadding: const EdgeInsets.all(5),
            // border: InputBorder.none, label: Text(labelText)),
            ),
      ),
      // Container(
      //   height: 55,
      //   decoration: BoxDecoration(
      //       border: Border.all(
      //         // color: mainRedShadeForText,
      //         width: 0.4,
      //       ),
      //       borderRadius: const BorderRadius.all(Radius.circular(20))),
      //   child: Row(
      //     children: [
      //       Expanded(
      //         flex: 9,
      //         child: Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 12.0),
      //           child: ,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
