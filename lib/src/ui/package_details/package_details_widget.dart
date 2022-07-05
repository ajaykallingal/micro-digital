import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:micro_digital/src/common/route_generator.dart';
import 'package:micro_digital/src/data/bloc/cart_bloc.dart';
import 'package:micro_digital/src/data/bloc/master_bloc.dart';
import 'package:micro_digital/src/data/model/cart/add_to_request.dart';
import 'package:micro_digital/src/data/model/master/package/single_package_response.dart';
import 'package:micro_digital/src/data/shared_pref/object_factory.dart';
import 'package:micro_digital/src/ui/package_details/components/select_member_screen_arguments.dart';

import '../flutter_flow/flutter_flow_theme.dart';

class PackageDetailsWidget extends StatefulWidget {
  const PackageDetailsWidget({Key? key}) : super(key: key);

  @override
  _PackageDetailsWidgetState createState() => _PackageDetailsWidgetState();
}

class _PackageDetailsWidgetState extends State<PackageDetailsWidget> {
  double? ratingBarValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final masterBloc = MasterBloc();
  final cartBloc = CartBloc();

  SinglePackageResponse? singlePackageResponse;

  @override
  void initState() {
    // TODO: implement initState
    masterBloc.singlePackageDetails(1);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    masterBloc.singlePackageDetailsSCListener.listen((event) {
      setState(() {
        singlePackageResponse = event;
      });
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/background.jpg',
                  ).image,
                ),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                        ),
                        child: Image.asset(
                          'assets/images/TOP_BAR.png',
                          width: double.infinity,
                          height: 155,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.chevron_left_rounded,
                                color: Colors.white,
                                size: 28,
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                            Text(
                              'Package Details',
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
                    ],
                  ),
                  Expanded(
                    child: singlePackageResponse != null
                        ? SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 20, 20, 0),
                                  child: Container(
                                    width: double.infinity,
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
                                    alignment: AlignmentDirectional(-0.4, 0),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 0),
                                          child: Text(
                                            singlePackageResponse!
                                                .basicDetails[0].product,
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle1
                                                .override(
                                                  fontFamily: 'Titillium Web',
                                                  fontSize: 14,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 0),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0),
                                              bottomRight: Radius.circular(0),
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                            child: Image.network(
                                              singlePackageResponse!
                                                  .basicDetails[0].imageDir,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 20, 20, 0),
                                          child: Text(
                                            singlePackageResponse!
                                                .basicDetails[0]
                                                .shortDescription,
                                            // 'The fat and purine rich food, hectic work atmosphere,\nclimate, mental pressure and others will result in significant increase in lifestyle diseases……',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Titillium Web',
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 20, 20, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'MRP   ₹${singlePackageResponse!.basicDetails[0].listPrice}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Titillium Web',
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                        ),
                                              ),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 0),
                                                    child: Image.asset(
                                                      'assets/images/verified.png',
                                                      width: 15,
                                                      height: 15,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                5, 0, 0, 0),
                                                    child: Text(
                                                      'Available',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Titillium Web',
                                                            color: Color(
                                                                0xFF8DC63F),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 10, 20, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    'MSP  ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily:
                                                              'Titillium Web',
                                                          fontSize: 14,
                                                        ),
                                                  ),
                                                  Text(
                                                    ' ₹${singlePackageResponse!.basicDetails[0].price}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily:
                                                              'Titillium Web',
                                                          color:
                                                              Color(0xFF26ABE2),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(95, 0, 0, 0),
                                                child: RatingBar.builder(
                                                  onRatingUpdate: (newValue) =>
                                                      setState(() =>
                                                          ratingBarValue =
                                                              newValue),
                                                  itemBuilder:
                                                      (context, index) => Icon(
                                                    Icons.star_rounded,
                                                    color: Color(0xFF8DC63F),
                                                  ),
                                                  direction: Axis.horizontal,
                                                  initialRating:
                                                      ratingBarValue ??= 3,
                                                  unratedColor:
                                                      Color(0xFF9E9E9E),
                                                  itemCount: 5,
                                                  itemSize: 20,
                                                  glowColor: Color(0xFF8DC63F),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 0, 0, 0),
                                              child: Text(
                                                'You save 10%',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Titillium Web',
                                                          color:
                                                              Color(0xFFA81515),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 200,
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: DefaultTabController(
                                              length: 3,
                                              initialIndex: 0,
                                              child: Column(
                                                children: [
                                                  TabBar(
                                                    labelColor:
                                                        Color(0xFF313450),
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText1,
                                                    indicatorColor:
                                                        Color(0xFF26ABE2),
                                                    tabs: [
                                                      Tab(
                                                        text: 'Description',
                                                      ),
                                                      Tab(
                                                        text: 'Reviews',
                                                      ),
                                                      Tab(
                                                        text: 'FAQ',
                                                      ),
                                                    ],
                                                  ),
                                                  Expanded(
                                                    child: TabBarView(
                                                      children: [
                                                        // Padding(
                                                        //   padding:
                                                        //       EdgeInsetsDirectional
                                                        //           .fromSTEB(20,
                                                        //               0, 20, 0),
                                                        //   child: Html(
                                                        //       data: singlePackageResponse!
                                                        //           .basicDetails[
                                                        //               0]
                                                        //           .fullDescription),
                                                        // ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(20,
                                                                      0, 20, 0),
                                                          child: AutoSizeText(
                                                            'The fat and purine rich food, hectic work atmosphere,\nclimate, mental pressure and others will result in significant increase in lifestyle diseases……',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Titillium Web',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(20,
                                                                      0, 20, 0),
                                                          child: Text(
                                                            'The fat and purine rich food, hectic work atmosphere,\nclimate, mental pressure and others will result in significant increase in lifestyle diseases……',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Titillium Web',
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 20, 20, 20),
                                  child: Container(
                                    width: double.infinity,
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
                                    child: Column(
                                      children: List.generate(
                                          singlePackageResponse!
                                              .testList.length,
                                          (index) => InkWell(
                                                onTap: () =>
                                                    Navigator.pushNamed(
                                                        context,
                                                        RouteGenerator
                                                            .testDetailPage),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(
                                                      20,
                                                      20,
                                                      20,
                                                      index ==
                                                              singlePackageResponse!
                                                                      .testList
                                                                      .length -
                                                                  1
                                                          ? 20
                                                          : 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        singlePackageResponse!
                                                            .testList[index]
                                                            .product,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle1
                                                                .override(
                                                                  fontFamily:
                                                                      'Titillium Web',
                                                                  fontSize: 13,
                                                                ),
                                                      ),
                                                      Text(
                                                        ' ₹${singlePackageResponse!.testList[index].price}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Titillium Web',
                                                                  color: Color(
                                                                      0xFF26ABE2),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 100,
                                )
                              ],
                            ),
                          )
                        : Center(child: CircularProgressIndicator()),
                  ),
                ],
              ),
            ),
            // Positioned(
            //   bottom: 0,
            //   child:  Container(
            //     decoration: BoxDecoration(
            //       color: Color(0xFF26ABE2),
            //       borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(20),
            //         topRight: Radius.circular(20),
            //       ),
            //     ),
            //     child: SafeArea(
            //       child: Container(
            //       width: MediaQuery.of(context).size.width,
            //       decoration: BoxDecoration(
            //         color: Color(0xFF26ABE2),
            //         borderRadius: BorderRadius.only(
            //           topLeft: Radius.circular(20),
            //           topRight: Radius.circular(20),
            //         ),
            //       ),
            //       child: Center(
            //         child: Text("Add to Cart",style: FlutterFlowTheme.of(context)
            //             .bodyText2
            //             .override(
            //           fontFamily: 'Titillium Web',
            //           color:
            //           FlutterFlowTheme.of(context).primaryBtnText,),),
            //       ),)
            //     ),
            //   ),)
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
                              color: Color(0x004B39EF),
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
                            color: Color(0x004B39EF),
                            onPressed: () {
                              cartBloc.addToCart(
                                  request: AddToCartRequest(
                                      productId: singlePackageResponse!
                                          .basicDetails[0].productId,
                                      userId: ObjectFactory()
                                          .prefs
                                          .getUserId()
                                          .toString(),
                                      productPrice: singlePackageResponse!
                                          .basicDetails[0].price));
                              Navigator.pushNamed(context, '/select_Member',
                                  arguments: SelectMemberScreenArguments(
                                    productName: singlePackageResponse!
                                        .basicDetails[0].product,
                                    totalTests: singlePackageResponse!
                                        .basicDetails[0].numberOfTestsInPackage
                                        .toString(),
                                  ));
                            },
                            child: Text(
                              "Add to cart",
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
        ),
      ),
    );
  }
}
