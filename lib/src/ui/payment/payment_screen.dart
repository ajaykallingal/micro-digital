import 'package:flutter/material.dart';

import '../../constants/assets.dart';
import '../flutter_flow/flutter_flow_theme.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          // extendBody: true,
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
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
                                  "Payment",
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
                      Column(
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                            child: Container(
                              width: double.infinity,
                              // height: 175,
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
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 20),
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: Container(
                                        height: 48,
                                        width: 48,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF5F5F5),
                                          borderRadius:
                                              BorderRadius.circular(9),
                                        ),
                                        child: Center(
                                          child: Image.asset(
                                              "assets/icons/pay_online.png",
                                              scale: 3),
                                        ),
                                      ),
                                      title: Text(
                                        "Pay Online",
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Titillium Web',
                                              color: Colors.black,
                                              fontSize: 19,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Divider(
                                      height: 1,
                                      thickness: 1,
                                      color: Color(0x19000000),
                                    ),
                                    SizedBox(height: 10),
                                    ListTile(
                                      leading: Container(
                                        height: 48,
                                        width: 48,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF5F5F5),
                                          borderRadius:
                                              BorderRadius.circular(9),
                                        ),
                                        child: Center(
                                          child: Image.asset(
                                              "assets/icons/pay@home.png",
                                              scale: 3),
                                        ),
                                      ),
                                      title: Text(
                                        "Pay @ Home",
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Titillium Web',
                                              color: Colors.black,
                                              fontSize: 19,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
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
                          Navigator.pushNamed(context, '/dashboard');
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
        ),
      ],
    );
  }
}
