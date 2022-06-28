import 'package:flutter/material.dart';
import 'package:micro_digital/src/data/model/categories/categories_request.dart';
import 'package:micro_digital/src/ui/categories/components/categories_detailed_page_arguments.dart';

import '../../common/route_generator.dart';
import '../../constants/assets.dart';
import '../../data/bloc/cart_bloc.dart';
import '../../data/bloc/master_bloc.dart';
import '../../data/model/categories/categories_response.dart';
import '../flutter_flow/flutter_flow_theme.dart';

class CategoriesDetailed extends StatefulWidget {
  final CategoriesDetailedViewPageArguments categoriesDetailedViewPageArguments;
  const CategoriesDetailed(
      {Key? key, required this.categoriesDetailedViewPageArguments})
      : super(key: key);

  @override
  State<CategoriesDetailed> createState() => _CategoriesDetailedState();
}

class _CategoriesDetailedState extends State<CategoriesDetailed> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final masterBloc = MasterBloc();
  final cartBloc = CartBloc();
  CategoriesResponse? categoriesResponse;

  @override
  void initState() {
    // TODO: implement initState
    masterBloc.categoriesRequest(CategoriesRequest(
        query: widget.categoriesDetailedViewPageArguments.categoryId.toString(),
        pageNo: "1"));
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    masterBloc.categoriesDetailsSCListener.listen((event) {
      setState(() {
        categoriesResponse = event;
      });
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
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
                              widget.categoriesDetailedViewPageArguments
                                  .categoryName,
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .subtitle1
                                  .override(
                                    fontFamily: 'Titillium Web',
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/cart');
                              },
                              icon: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Image.asset(Assets.iconCart),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: categoriesResponse != null
                        ? ListView.builder(
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 20, 0),
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
                                              categoriesResponse!
                                                  .packages![index].product,
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle1
                                                      .override(
                                                        fontFamily:
                                                            'Titillium Web',
                                                        fontSize: 16,
                                                        color: Colors.white,
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
                                              // height: 350,
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
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10, top: 10),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          ' ₹${categoriesResponse!.packages![index].price}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .subtitle1
                                                              .override(
                                                                fontFamily:
                                                                    'Titillium Web',
                                                                color: Color(
                                                                    0xFF9AC12B),
                                                                fontSize: 21,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                        ),
                                                        SizedBox(width: 10),
                                                        Text(
                                                          '₹${categoriesResponse!.packages![index].listPrice}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Titillium Web',
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      TextButton.icon(
                                                        onPressed: () {
                                                          if (categoriesResponse!
                                                                  .packages![
                                                                      index]
                                                                  .isPackage ==
                                                              "0") {
                                                            Navigator.pushNamed(
                                                                context,
                                                                RouteGenerator
                                                                    .testDetailPage);
                                                          } else if (categoriesResponse!
                                                                  .packages![
                                                                      index]
                                                                  .isPackage ==
                                                              "1") {
                                                            Navigator.pushNamed(
                                                                context,
                                                                RouteGenerator
                                                                    .packageDetailsPage);
                                                          }
                                                        },
                                                        style: TextButton
                                                            .styleFrom(
                                                          primary:
                                                              Color(0xFFA3A3A3),
                                                        ),
                                                        label: Text(
                                                          ' Details',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .subtitle1
                                                              .override(
                                                                fontFamily:
                                                                    'Titillium Web',
                                                                color: Color(
                                                                    0xFFA3A3A3),
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                        ),
                                                        icon: ImageIcon(AssetImage(
                                                            "assets/icons/details.png")),
                                                      ),
                                                      // SizedBox(width: 10),
                                                      TextButton.icon(
                                                        onPressed: () {},
                                                        style: TextButton
                                                            .styleFrom(
                                                          primary:
                                                              Color(0xFF26ABE2),
                                                        ),
                                                        label: Text(
                                                          ' Add to Cart',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .subtitle1
                                                              .override(
                                                                fontFamily:
                                                                    'Titillium Web',
                                                                color: Color(
                                                                    0xFF26ABE2),
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                        ),
                                                        icon: ImageIcon(AssetImage(
                                                            "assets/icons/cart.png")),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(height: 5),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  )
                                ],
                              );
                            },
                            itemCount: categoriesResponse!.packages!.length,
                            physics: BouncingScrollPhysics(),
                          )
                        : Center(
                            child: RefreshProgressIndicator(
                            backgroundColor: Colors.white,
                            color: Colors.blue,
                          )),
                  ),
                  SizedBox(
                    height: 20,
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
          ],
        ),
      ),
    );
  }
}
