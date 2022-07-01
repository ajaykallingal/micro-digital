import 'package:flutter/material.dart';
import 'package:micro_digital/src/common/styles.dart';
import 'package:micro_digital/src/data/bloc/profile_bloc.dart';
import 'package:micro_digital/src/ui/package_details/components/select_member_screen_arguments.dart';

import '../../data/bloc/cart_bloc.dart';
import '../../data/bloc/master_bloc.dart';
import '../../data/model/cart/add_to_request.dart';
import '../../data/model/master/package/single_package_response.dart';
import '../../data/model/profile/list_my_profile/list_my_profile_response.dart';
import '../../data/utils/screen_size/size_config.dart';
import '../flutter_flow/flutter_flow_theme.dart';

class SelectMemberPage extends StatefulWidget {
  final SelectMemberScreenArguments selectMemberScreenArguments;
  const SelectMemberPage({Key? key, required this.selectMemberScreenArguments})
      : super(key: key);

  @override
  State<SelectMemberPage> createState() => _SelectMemberPageState();
}

class _SelectMemberPageState extends State<SelectMemberPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final masterBloc = MasterBloc();
  final cartBloc = CartBloc();
  final profileBloc = ProfileBloc();

  SinglePackageResponse? singlePackageResponse;
  ListMyProfileResponse? listMyProfileResponse;
  double _width = 0.0;
  double _height = 0.0;
  bool isChecked = false;
  // List<MyProfileList>? myProfileList = List.empty(growable: true);

  @override
  void initState() {
    // TODO: implement initState
    masterBloc.singlePackageDetails(1);
    profileBloc.listMyProfile(203);
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

    profileBloc.listMyProfileSCListener.listen((event) {
      setState(() {
        listMyProfileResponse = event;
      });
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: listMyProfileResponse != null
          ? Stack(
              children: <Widget>[
                // The containers in the background and scrollable
                CustomScrollView(
                  physics: ClampingScrollPhysics(),
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
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
                                          "${widget.selectMemberScreenArguments.productName}",
// singlePackageResponse!
//     .basicDetails[0].category,
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
                                          padding: EdgeInsets.all(20),
                                          width: double.infinity,
                                          // height: 370,
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
                                          child: SingleChildScrollView(
                                            physics: BouncingScrollPhysics(),
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
                                                      "${widget.selectMemberScreenArguments.totalTests}",
// " ${singlePackageResponse!.basicDetails[0].numberOfTestsInPackage} Tests",
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
                                                Column(
                                                  children: List.generate(
                                                    listMyProfileResponse!
                                                        .myProfileList!.length,
                                                    (index) => InkWell(
                                                      // onTap: ()=>Navigator.pushNamed(context, RouteGenerator.bookingDetailPage),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                listMyProfileResponse!
                                                                    .myProfileList![
                                                                        index]
                                                                    .sFirstname,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Titillium Web',
                                                                      fontSize:
                                                                          16,
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                    ),
                                                              ),
                                                              Text(", "),
                                                              Text(
                                                                listMyProfileResponse!
                                                                    .myProfileList![
                                                                        index]
                                                                    .sFirstname,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Titillium Web',
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(height: 5),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "Male, 21",
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Titillium Web',
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    isChecked =
                                                                        !isChecked;
                                                                  });
                                                                },
                                                                child: isChecked
                                                                    ? Container(
                                                                        margin:
                                                                            EdgeInsets.zero,
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        height:
                                                                            20,
                                                                        width:
                                                                            20,
                                                                        // child: Image.asset('assets/images/TICK.png',height: 30,width: 30,fit: BoxFit.cover,),
                                                                        decoration:
                                                                            const BoxDecoration(
                                                                          // color: Colors.white,
                                                                          shape:
                                                                              BoxShape.circle,

                                                                          image:
                                                                              DecorationImage(
                                                                            image:
                                                                                AssetImage('assets/icons/radio.png'),
                                                                            fit:
                                                                                BoxFit.fill,
                                                                          ),
                                                                          // color: mainRedShadeForText,
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                                blurRadius: 1.5,
                                                                                color: Colors.black26,
                                                                                offset: Offset(0, 1))
                                                                          ],
                                                                        ),
                                                                      )
                                                                    : Container(
                                                                        height:
                                                                            20,
                                                                        width:
                                                                            20,
                                                                        decoration:
                                                                            const BoxDecoration(
                                                                          shape:
                                                                              BoxShape.circle,
                                                                          color:
                                                                              Colors.white,
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                                blurRadius: 1.5,
                                                                                color: Colors.black38,
                                                                                offset: Offset(0, 1))
                                                                          ],
                                                                        ),
                                                                      ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(height: 10),

                                                          // ListTile(
                                                          //   title:
                                                          //   Row(
                                                          //     children: [
                                                          //       Text(
                                                          //         listMyProfileResponse!
                                                          //             .myProfileList![
                                                          //                 index]
                                                          //             .sFirstname,
                                                          //         style: FlutterFlowTheme.of(
                                                          //                 context)
                                                          //             .subtitle1
                                                          //             .override(
                                                          //               fontFamily:
                                                          //                   'Titillium Web',
                                                          //               fontSize:
                                                          //                   16,
                                                          //               color: Colors
                                                          //                   .black,
                                                          //               fontWeight:
                                                          //                   FontWeight.w700,
                                                          //             ),
                                                          //       ),
                                                          //       Text(", "),
                                                          //       Text(
                                                          //         listMyProfileResponse!
                                                          //             .myProfileList![
                                                          //                 index]
                                                          //             .sFirstname,
                                                          //         style: FlutterFlowTheme.of(
                                                          //                 context)
                                                          //             .subtitle1
                                                          //             .override(
                                                          //               fontFamily:
                                                          //                   'Titillium Web',
                                                          //               fontSize:
                                                          //                   12,
                                                          //               color: Colors
                                                          //                   .black,
                                                          //               fontWeight:
                                                          //                   FontWeight.w500,
                                                          //             ),
                                                          //       ),
                                                          //     ],
                                                          //   ),
                                                          //   subtitle: Text(
                                                          //     "Male, 21",
                                                          //     style: FlutterFlowTheme
                                                          //             .of(context)
                                                          //         .subtitle1
                                                          //         .override(
                                                          //           fontFamily:
                                                          //               'Titillium Web',
                                                          //           fontSize:
                                                          //               12,
                                                          //           color: Colors
                                                          //               .black,
                                                          //           fontWeight:
                                                          //               FontWeight
                                                          //                   .w500,
                                                          //         ),
                                                          //   ),
                                                          // ),
                                                          Divider(
                                                            height: 1,
                                                            thickness: 1,
                                                            color: Color(
                                                                0x19000000),
                                                          ),
                                                          SizedBox(height: 10),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  // ListView.builder(
                                                  //   itemBuilder: (context, index) {
                                                  //     return Container(
                                                  //       child: Row(
                                                  //         mainAxisAlignment:
                                                  //             MainAxisAlignment
                                                  //                 .spaceBetween,
                                                  //         children: [
                                                  //           Padding(
                                                  //             padding:
                                                  //                 const EdgeInsets
                                                  //                     .all(8.0),
                                                  //             child: Column(
                                                  //               crossAxisAlignment:
                                                  //                   CrossAxisAlignment
                                                  //                       .start,
                                                  //               children: [
                                                  //                 Text(
                                                  //                   listMyProfileResponse!
                                                  //                       .myProfileList![
                                                  //                           index]
                                                  //                       .sFirstname,
                                                  //                   style: FlutterFlowTheme.of(
                                                  //                           context)
                                                  //                       .subtitle1
                                                  //                       .override(
                                                  //                         fontFamily:
                                                  //                             'Titillium Web',
                                                  //                         fontSize:
                                                  //                             21,
                                                  //                         color: Color(
                                                  //                             0xFF26ABE2),
                                                  //                       ),
                                                  //                 ),
                                                  //                 Text(
                                                  //                   "",
                                                  //                   // "includes:  ${listCartItems!.cartList![index].productId} Tests",
                                                  //                   style: FlutterFlowTheme.of(
                                                  //                           context)
                                                  //                       .subtitle1
                                                  //                       .override(
                                                  //                         fontFamily:
                                                  //                             'Titillium Web',
                                                  //                         fontSize:
                                                  //                             13,
                                                  //                         fontWeight:
                                                  //                             FontWeight
                                                  //                                 .w600,
                                                  //                       ),
                                                  //                 ),
                                                  //               ],
                                                  //             ),
                                                  //           ),
                                                  //         ],
                                                  //       ),
                                                  //     );
                                                  //   },
                                                  //   itemCount:
                                                  //       listMyProfileResponse!
                                                  //           .myProfileList!.length,
                                                  //   physics:
                                                  //       NeverScrollableScrollPhysics(),
                                                  // )

                                                  // listMyProfileResponse != null
//                                                       ? ListView.builder(
//                                                           itemBuilder:
//                                                               (context, index) {
//                                                             return ListTile(
//                                                               title: Text(
//                                                                 listMyProfileResponse!
//                                                                     .myProfileList![
//                                                                         index]
//                                                                     .sFirstname,
// // listMyProfileResponse
// //     .myProfileList
// //     .basicDetails[0]
// //     .price,
//                                                                 style: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .subtitle1
//                                                                     .override(
//                                                                       fontFamily:
//                                                                           'Titillium Web',
//                                                                       fontSize:
//                                                                           10,
//                                                                       color: Color(
//                                                                           0xFF000000),
//                                                                     ),
//                                                               ),
//                                                               trailing: InkWell(
//                                                                 onTap: () {
//                                                                   setState(() {
// // widget.isFavChecked =
// //     !widget
// //         .isFavChecked;
//                                                                   });
//                                                                 },
//                                                                 child:
//                                                                     Container(
//                                                                   height: 65,
//                                                                   width: 65,
//                                                                   decoration:
//                                                                       BoxDecoration(
//                                                                     image:
//                                                                         DecorationImage(
//                                                                       image: AssetImage(
//                                                                           "assets/icons/radio.png"),
//                                                                     ),
//                                                                     color: Colors
//                                                                         .white
//                                                                         .withOpacity(
//                                                                             1.0),
//                                                                     borderRadius:
//                                                                         const BorderRadius
//                                                                             .all(
//                                                                       Radius.circular(
//                                                                           10),
//                                                                     ),
//                                                                     boxShadow: [
//                                                                       BoxShadow(
//                                                                         color: Colors
//                                                                             .grey[350]!,
//                                                                         offset: const Offset(
//                                                                             5.0,
//                                                                             5.0),
//                                                                         blurRadius:
//                                                                             15.0,
//                                                                         spreadRadius:
//                                                                             1.0,
//                                                                       ),
//                                                                       const BoxShadow(
//                                                                         color: Colors
//                                                                             .white,
//                                                                         offset: Offset(
//                                                                             -5.0,
//                                                                             -5.0),
//                                                                         blurRadius:
//                                                                             15.0,
//                                                                         spreadRadius:
//                                                                             1.0,
//                                                                       ),
//                                                                     ],
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                             );
//                                                             Row(
//                                                               children: [
//                                                                 Text(
//                                                                   listMyProfileResponse!
//                                                                       .myProfileList![
//                                                                           index]
//                                                                       .sFirstname,
// // listMyProfileResponse
// //     .myProfileList
// //     .basicDetails[0]
// //     .price,
//                                                                   style: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .subtitle1
//                                                                       .override(
//                                                                         fontFamily:
//                                                                             'Titillium Web',
//                                                                         fontSize:
//                                                                             16,
//                                                                         color: Color(
//                                                                             0xFF000000),
//                                                                       ),
//                                                                 ),
//                                                                 InkWell(
//                                                                   onTap: () {
//                                                                     setState(
//                                                                         () {
// // widget.isFavChecked =
// //     !widget
// //         .isFavChecked;
//                                                                     });
//                                                                   },
//                                                                   child:
//                                                                       Container(
//                                                                     height: 65,
//                                                                     width: 65,
//                                                                     decoration:
//                                                                         BoxDecoration(
//                                                                       image:
//                                                                           DecorationImage(
//                                                                         image: AssetImage(
//                                                                             "assets/icons/radio.png"),
//                                                                       ),
//                                                                       color: Colors
//                                                                           .white
//                                                                           .withOpacity(
//                                                                               1.0),
//                                                                       borderRadius:
//                                                                           const BorderRadius
//                                                                               .all(
//                                                                         Radius.circular(
//                                                                             10),
//                                                                       ),
//                                                                       boxShadow: [
//                                                                         BoxShadow(
//                                                                           color:
//                                                                               Colors.grey[350]!,
//                                                                           offset: const Offset(
//                                                                               5.0,
//                                                                               5.0),
//                                                                           blurRadius:
//                                                                               15.0,
//                                                                           spreadRadius:
//                                                                               1.0,
//                                                                         ),
//                                                                         const BoxShadow(
//                                                                           color:
//                                                                               Colors.white,
//                                                                           offset: Offset(
//                                                                               -5.0,
//                                                                               -5.0),
//                                                                           blurRadius:
//                                                                               15.0,
//                                                                           spreadRadius:
//                                                                               1.0,
//                                                                         ),
//                                                                       ],
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 Container(
// // alignment: Alignment.bottomRight,
//                                                                   margin:
//                                                                       EdgeInsets
//                                                                           .zero,
//                                                                   padding:
//                                                                       EdgeInsets
//                                                                           .zero,
//                                                                   height: 10,
//                                                                   width: 10,
// // child: Image.asset('assets/images/TICK.png',height: 30,width: 30,fit: BoxFit.cover,),
//                                                                   decoration:
//                                                                       const BoxDecoration(
// // color: Colors.white,
//                                                                     shape: BoxShape
//                                                                         .circle,
//
//                                                                     image:
//                                                                         DecorationImage(
//                                                                       image: AssetImage(
//                                                                           'assets/images/checked.png'),
//                                                                       fit: BoxFit
//                                                                           .fill,
//                                                                     ),
// // color: mainRedShadeForText,
//                                                                     boxShadow: [
//                                                                       BoxShadow(
//                                                                           blurRadius:
//                                                                               1.5,
//                                                                           color: Colors
//                                                                               .black26,
//                                                                           offset: Offset(
//                                                                               0,
//                                                                               1))
//                                                                     ],
//                                                                   ),
//                                                                 ),
// // SizedBox(width: 8)
//                                                               ],
//                                                             );
//                                                           },
//                                                           itemCount: 2,
//                                                           physics:
//                                                               NeverScrollableScrollPhysics(),
//                                                         )
//                                                       : Center(
//                                                           child:
//                                                               CircularProgressIndicator(
//                                                                   strokeWidth:
//                                                                       1),
//                                                         ),
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
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(
                                        MediaQuery.of(context).size.width, 44),
                                    primary: Color(0xFF9AC12B),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text("Add test"),
                                  // icon: Icon(Icons.add),
                                  // label:
                                ),
                              ),
                              SizedBox(height: 80),
                            ],
                          ),
                        ),
                        childCount: 1,
                      ),
                    )
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
                                          userId: "203",
                                          productPrice: singlePackageResponse!
                                              .basicDetails[0].price));
                                  Navigator.pushNamed(context, '/cart');
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
            )
          : Center(
              child: RefreshProgressIndicator(
                color: mainBlueShade,
                backgroundColor: Colors.white,
              ),
            ),
    );
  }
}
