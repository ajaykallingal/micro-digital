import 'package:flutter/material.dart';
import 'package:micro_digital/src/common/route_generator.dart';
import 'package:micro_digital/src/constants/assets.dart';
import 'package:micro_digital/src/data/bloc/search_bloc.dart';
import 'package:micro_digital/src/data/model/search/search_package_response.dart';
import 'package:micro_digital/src/data/model/search/search_request.dart';
import 'package:micro_digital/src/data/model/search/search_test_response.dart';
import 'package:micro_digital/src/data/utils/screen_size/size_config.dart';
import 'package:micro_digital/src/ui/flutter_flow/flutter_flow_theme.dart';
import 'package:micro_digital/src/ui/widgets/header.dart';

class BookTestScreen extends StatefulWidget {
  const BookTestScreen({Key? key}) : super(key: key);

  @override
  _BookTestScreenState createState() => _BookTestScreenState();
}

class _BookTestScreenState extends State<BookTestScreen> with Header {
  List<String> tabName = ["Tests", "Packages"];
  List<Widget> tabWidget = List.empty(growable: true);
  int currentTabIndex = 0;
  TextEditingController searchTextController = TextEditingController();
  final searchBloc = SearchBloc();
  List<Test> tests = List.empty(growable: true);
  List<Package> package = List.empty(growable: true);


  @override
  void initState() {
    super.initState();
    searchBloc.searchTest(
        request: SearchRequest(
            query: searchTextController.text, pageNo: "1"));
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    searchBloc.searchTestSCListener.listen((event) {
      setState(() {
        tests = event.tests;
      });
    });
    searchBloc.searchPackageSCListener.listen((event) {
      setState(() {
        package = event.packages;
      });
    });
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    tabWidget = [buildTestPanel(), buildPackages()];
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          // The containers in the background and scrollable
          getScrollableBody(),

          // This container will work as Overlay
          SizedBox(
            height: 165,
            child: Stack(
              children: [
                getOverlayWidget(context: context, isHome: false),
                const Center(
                  child: Text(
                    "Book a Package",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            top: 30,
            right: 2,
            left: 2,
            child: getSearchWidget(
                context: context,
                textEditingController: searchTextController,
                onSubmitted: (s) {
                  if (currentTabIndex == 0) {
                    searchBloc.searchTest(
                        request: SearchRequest(
                            query: searchTextController.text, pageNo: "1"));
                  } else {
                    searchBloc.searchPackage(
                        request: SearchRequest(
                            query: searchTextController.text, pageNo: "1"));
                  }
                }),
          )
        ],
      ),
    );
  }

  Widget getScrollableBody() {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: ExactAssetImage(Assets.background))),
      child: Column(
        children: <Widget>[
          SizedBox(height: SizeConfig.screenHeight! * .22),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                  2,
                  (index) => GestureDetector(
                        onTap: () => setState(() {
                          currentTabIndex = index;

                        }),
                        child: Container(
                          height: 40,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(0, 0),
                                  color: Colors.grey.shade300,
                                  blurRadius: 7)
                            ],
                            border: Border.all(
                                color: currentTabIndex == index
                                    ? Color(0xFF1DB3ED)
                                    : Colors.transparent),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              tabName[index],
                              style: TextStyle(
                                  color: currentTabIndex == index
                                      ? Color(0xFF1DB3ED)
                                      : Colors.black,
                                  fontSize: 17),
                            ),
                          ),
                        ),
                      )),
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight! * .02),
          tabWidget[currentTabIndex]
        ],
      ),
    );
  }

  // Widget buildPopularTest() {
  //   return Expanded(
  //     child: Container(
  //       margin: const EdgeInsets.symmetric(horizontal: 23),
  //       decoration: BoxDecoration(
  //         borderRadius: const BorderRadius.only(
  //             topRight: Radius.circular(20), topLeft: Radius.circular(20)),
  //         boxShadow: [
  //           BoxShadow(
  //               offset: const Offset(0, 0),
  //               color: Colors.grey.shade200,
  //               blurRadius: 5)
  //         ],
  //         color: Colors.white,
  //       ),
  //       child: Column(
  //         children: [
  //           Padding(
  //             padding: const EdgeInsets.only(top: 16.0),
  //             child: Align(
  //               alignment: Alignment.center,
  //               child: Text(
  //                 "Don’t know the test name?",
  //                 style: TextStyle(color: Color(0xFF1DB3ED), fontSize: 16),
  //               ),
  //             ),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Align(
  //               alignment: Alignment.centerLeft,
  //               child: Text(
  //                   "Press the button below tobook a test or upload photo of your doctor’s prescription. Please make sure that the photo is clear and that the prescription is valid"),
  //             ),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.only(top: 8.0),
  //             child: Align(
  //               alignment: Alignment.center,
  //               child: GestureDetector(
  //                 onTap: ()=>showDialog(
  //                     context: context,
  //                     builder: (BuildContext context) {
  //                       return AlertDialog(
  //                         content: Container(
  //                           height: 400,width: 300,
  //                           child: Column(
  //
  //                             children: List.generate(3, (index) => Row(
  //                               mainAxisSize: MainAxisSize.max,
  //                               mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                               children: [
  //                                 Text("AABC"),
  //                                 IconButton(onPressed: (){}, icon: Icon(Icons.assignment_turned_in_outlined))
  //                               ],
  //                             ))
  //                           ),
  //                         ),
  //                       );
  //                     }),
  //                 child: Container(
  //                   height: 40,
  //                   width: 160,
  //                   decoration: BoxDecoration(
  //                       borderRadius: const BorderRadius.all(
  //                         Radius.circular(20),
  //                       ),
  //                       boxShadow: [
  //                         BoxShadow(
  //                             offset: const Offset(0, 0),
  //                             color: Colors.grey.shade300,
  //                             blurRadius: 7)
  //                       ],
  //                       color: Color(0xFF1DB3ED)),
  //                   child: Center(
  //                     child: Text(
  //                       "Change Branch",
  //                       style: TextStyle(color: Colors.white, fontSize: 17),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget buildPackages() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            width: MediaQuery.of(context).size.width * .9,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: List.generate(
                    package.length,
                    (index) => InkWell(
                          onTap: () => Navigator.pushNamed(
                              context, RouteGenerator.packageDetailsPage),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 15, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      package[index].product,
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Titillium Web',
                                            color: Color(0xFF313450),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Text(
                                      '₹ ${package[index].price}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Titillium Web',
                                            color: Color(0xFF26ABE2),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Total Tests :',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Titillium Web',
                                            color: Color(0xBF101213),
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          3, 0, 0, 0),
                                      child: Text(
                                        package[index].numberOfTestsInPackage.toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 1,
                                thickness: 0.1,
                                color: Color(0xFF010101),
                              ),
                            ],
                          ),
                        )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTestPanel() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            width: MediaQuery.of(context).size.width * .9,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: List.generate(
                    tests.length,
                    (index) => InkWell(
                          onTap: () => Navigator.pushNamed(
                              context, RouteGenerator.testDetailPage),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 15, 20, 15),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      tests[index].product,
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Titillium Web',
                                            color: Color(0xFF313450),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Text(
                                      '₹ ${tests[index].price}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Titillium Web',
                                            color: Color(0xFF26ABE2),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 1,
                                thickness: 0.1,
                                color: Color(0xFF010101),
                              ),
                            ],
                          ),
                        )),
              ),
            ),
          ),
        ),
      ),
    );
  }
// Widget getDetailedPackage(){
//   return Column(
//     children: [
//       IntrinsicHeight(
//         child: Container(
//           child: Row(
//             children: [
//               Expanded(
//                   flex: 2,
//                   child: Container(
//                     color: Color(0xFFF5F5F5),
//                     child: Center(
//                       child: Text("600\nINR"),
//                     ),
//                   )),
//               Expanded(
//                   flex: 7,
//                   child: Container(
//                     color: Colors.white,
//                     child: Column(
//                       children: [
//
//                         Padding(
//                           padding: const EdgeInsets.only(left:8.0,right: 8,top: 12),
//                           child: Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               "Complete Blood Count (CBC)",
//                               style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w700),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left:8.0,right: 8,top: 12),
//                           child: Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text.rich(
//                               TextSpan(
//                                 children: [
//                                   TextSpan(
//                                     text: 'Total Tests : ',
//                                     style: TextStyle(
//                                         color: const Color(0xFF000000)
//                                             .withOpacity(.49)),
//                                   ),
//                                   const TextSpan(
//                                     text: ' 15',
//                                     style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 12),
//                           child: Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               "Differential Leucocyte Count (DC), HCT / PCV, Hemoglobin, Absolute Count, MCH, MCHC, MCV, MPV, NRBC, Platelet Count, Platelet CRIT - PCT",
//                               style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w400),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )),
//               Flexible(
//                   flex: 1,
//                   child: Container(
//                     color: Color(0xFFF5F5F5),
//                     child: Icon(Icons.add_shopping_cart,color: Color(0xFF1DB3ED),),
//                   )),
//             ],
//           ),
//         ),
//       ),
//       Divider(
//         thickness: 1,
//         height: 2,
//         color: Colors.grey,
//       )
//     ],
//   );
// }

}
