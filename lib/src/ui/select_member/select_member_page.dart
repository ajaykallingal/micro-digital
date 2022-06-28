import 'package:flutter/material.dart';

import '../../data/bloc/cart_bloc.dart';
import '../../data/bloc/master_bloc.dart';
import '../../data/model/list_my_profile/list_my_profile_response.dart';
import '../../data/model/master/package/single_package_response.dart';
import '../flutter_flow/flutter_flow_theme.dart';

class SelectMemberPage extends StatefulWidget {
  const SelectMemberPage({Key? key}) : super(key: key);

  @override
  State<SelectMemberPage> createState() => _SelectMemberPageState();
}

class _SelectMemberPageState extends State<SelectMemberPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final masterBloc = MasterBloc();
  final cartBloc = CartBloc();

  SinglePackageResponse? singlePackageResponse;
  ListMyProfileResponse? listMyProfileResponse;

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

    masterBloc.listMyProfileSCListener.listen((event) {
      setState(() {
        listMyProfileResponse = event;
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
                              'Select member',
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
                                      color: Color(0xFF26ABE2),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 13,
                                          color: Color(0x2C000000),
                                          offset: Offset(0, 1),
                                          spreadRadius: 1,
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    alignment: AlignmentDirectional(-0.4, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, top: 20),
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
                                        SizedBox(height: 20),
                                        ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            // bottomLeft: Radius.circular(0),
                                            // bottomRight: Radius.circular(0),
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            height: 270,
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
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'includes: ',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle1
                                                              .override(
                                                                fontFamily:
                                                                    'Titillium Web',
                                                                fontSize: 12,
                                                                color: Color(
                                                                    0xFF26ABE2),
                                                              ),
                                                    ),
                                                    Text(
                                                      " ${singlePackageResponse!.basicDetails[0].numberOfTestsInPackage} Tests",
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .subtitle1
                                                          .override(
                                                            fontFamily:
                                                                'Titillium Web',
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Recommended for: ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .subtitle1
                                                              .override(
                                                                fontFamily:
                                                                    'Titillium Web',
                                                                fontSize: 12,
                                                                color: Color(
                                                                    0xFF26ABE2),
                                                              ),
                                                        ),
                                                        Text(
                                                          "Male & female",
                                                          // " ${singlePackageResponse!.basicDetails[0].category}",
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .subtitle1
                                                              .override(
                                                                fontFamily:
                                                                    'Titillium Web',
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          singlePackageResponse!
                                                              .basicDetails[0]
                                                              .price,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .subtitle1
                                                              .override(
                                                                fontFamily:
                                                                    'Titillium Web',
                                                                fontSize: 21,
                                                                color: Color(
                                                                    0xFF9AC12B),
                                                              ),
                                                        ),
                                                        SizedBox(width: 8),
                                                        Text(
                                                          " ${singlePackageResponse!.basicDetails[0].listPrice}",
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .subtitle1
                                                              .override(
                                                                fontFamily:
                                                                    'Titillium Web',
                                                                fontSize: 14,
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough,
                                                                color: Color(
                                                                    0xFFAAAAAA),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 30),
                                                Row(
                                                  children: [
                                                    Text(
                                                      singlePackageResponse!
                                                          .basicDetails[0]
                                                          .price,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle1
                                                              .override(
                                                                fontFamily:
                                                                    'Titillium Web',
                                                                fontSize: 16,
                                                                color: Color(
                                                                    0xFF000000),
                                                              ),
                                                    ),
                                                    SizedBox(width: 8),
                                                    Text(
                                                      " ${singlePackageResponse!.basicDetails[0].listPrice}",
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .subtitle1
                                                          .override(
                                                            fontFamily:
                                                                'Titillium Web',
                                                            fontSize: 14,
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough,
                                                            color: Color(
                                                                0xFFAAAAAA),
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "John Mathews",
                                                      // listMyProfileResponse
                                                      //     .myProfileList
                                                      //     .basicDetails[0]
                                                      //     .price,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle1
                                                              .override(
                                                                fontFamily:
                                                                    'Titillium Web',
                                                                fontSize: 16,
                                                                color: Color(
                                                                    0xFF000000),
                                                              ),
                                                    ),
                                                    // SizedBox(width: 8)
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    // fixedSize: Size(44, 378),
                                    primary: Color(0xFF9AC12B),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () {},
                                  icon: Icon(Icons.add),
                                  label: Text("Add new member"),
                                ),
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
                              // cartBloc.addToCart(
                              //     request: AddToCartRequest(
                              //         productId: "494",
                              //         userId: "134",
                              //         productPrice: "1500.00"));
                            },
                            child: Text(
                              "View Cart",
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
