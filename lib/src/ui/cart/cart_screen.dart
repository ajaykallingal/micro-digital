import 'package:flutter/material.dart';
import 'package:micro_digital/src/common/styles.dart';
import 'package:micro_digital/src/data/bloc/cart_bloc.dart';
import 'package:micro_digital/src/data/bloc/order_bloc.dart';
import 'package:micro_digital/src/data/model/cart/delete_cart_request.dart';

import '../../data/model/cart/add_to_cart_response.dart';
import '../../data/utils/screen_size/size_config.dart';
import '../flutter_flow/flutter_flow_theme.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double _width = 0.0;
  double _height = 0.0;
  final cartBloc = CartBloc();
  // List<CartList> cartList = List.empty(growable: true);
  AddToCartResponse? listCartItems;
  final orderBloc = OrderBloc();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cartBloc.addToCartSCListener.listen((event) {
      if (mounted) {
        setState(() {
          // cartList = event.cartList;
          listCartItems = event;

          // brandList =event.b;
          // recommendedPackageList = event.r
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // Add code after super
    cartBloc.getCartList(203);
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    SizeConfig().init(context);
    // iconList = [
    //   Assets.iconBookTest,
    //   Assets.iconTestInfo,
    //   Assets.iconPackages,
    //   Assets.iconMyReports
    // ];
    // iconRiskAreaList = [
    //   Assets.iconArthritis,
    //   Assets.iconDrunk,
    //   Assets.iconFood
    // ];
    // iconBrandList = [
    //   Assets.iconBrand1,
    //   Assets.iconBrand2,
    //   Assets.iconBrand3,
    //   Assets.iconBrand4
    // ];
    // imageSliders = List.generate(
    //     5,
    //     (index) => SizedBox(
    //           height: 100,
    //           child: ClipRRect(
    //               borderRadius: const BorderRadius.all(Radius.circular(12.0)),
    //               child: Image.network(
    //                 "https://africa-images.com/public/photos/h/M/hMXsH3fMwp1YYT0gdKDG7v7Wo/hMXsH3fMwp1YYT0gdKDG7v7Wo_small.jpg",
    //                 fit: BoxFit.fill,
    //                 height: 100,
    //                 width: MediaQuery.of(context).size.width,
    //               )),
    //         ));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: listCartItems != null
          ? Stack(
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
                                  'My cart',
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
                              // buildFirstRow(),
                              //
                              // SizedBox(
                              //   height: 80,
                              // ),
                              Column(
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
                                              "",
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle1
                                                      .override(
                                                        fontFamily:
                                                            'Titillium Web',
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
                                              child: listCartItems != null
                                                  ? ListView.builder(
                                                      itemBuilder:
                                                          (context, index) {
                                                        return Container(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      listCartItems!
                                                                          .cartList![
                                                                              index]
                                                                          .product,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Titillium Web',
                                                                            fontSize:
                                                                                21,
                                                                            color:
                                                                                Color(0xFF26ABE2),
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      "includes:  ${listCartItems!.cartList![index].productId} Tests",
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Titillium Web',
                                                                            fontSize:
                                                                                13,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                          listCartItems!
                                                                              .cartList![index]
                                                                              .price,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .subtitle1
                                                                              .override(
                                                                                fontFamily: 'Titillium Web',
                                                                                fontSize: 13,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                        SizedBox(
                                                                            width:
                                                                                7),
                                                                        Text(
                                                                          listCartItems!
                                                                              .cartList![index]
                                                                              .amount,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .subtitle1
                                                                              .override(
                                                                                fontFamily: 'Titillium Web',
                                                                                fontSize: 13,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              IconButton(
                                                                onPressed: () {
                                                                  showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (ctx) =>
                                                                            AlertDialog(
                                                                      title: Text(
                                                                          "Delete item from cart."),
                                                                      content: Text(
                                                                          "Do you wish to delete this item from cart?"),
                                                                      actions: <
                                                                          Widget>[
                                                                        TextButton(
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.of(ctx).pop();
                                                                          },
                                                                          child:
                                                                              Text("Cancel"),
                                                                        ),
                                                                        TextButton(
                                                                          onPressed:
                                                                              () {
                                                                            cartBloc.deleteFromCart(
                                                                              request: DeleteCartRequest(
                                                                                userId: "203",
                                                                                productId: listCartItems!.cartList![index].productId,
                                                                              ),
                                                                            );
                                                                            Navigator.of(ctx).pop();
                                                                          },
                                                                          child:
                                                                              Text("Confirm"),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ).then(
                                                                      (value) {
                                                                    Center(
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        color:
                                                                            mainBlueShade,
                                                                        strokeWidth:
                                                                            1,
                                                                      ),
                                                                    );
                                                                  });
                                                                },
                                                                icon: ImageIcon(
                                                                  AssetImage(
                                                                      "assets/icons/delete.png"),
                                                                ),
                                                                color:
                                                                    mainBlueShade,
                                                                iconSize: 18,
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                      itemCount: listCartItems!
                                                          .cartList!.length,
                                                      physics:
                                                          BouncingScrollPhysics(),
                                                    )
                                                  : Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: mainBlueShade,
                                                        strokeWidth: 1,
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
                                            MediaQuery.of(context).size.width,
                                            44),
                                        primary: Color(0xFF9AC12B),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Text("Add test"),
                                      // icon: Icon(Icons.add),
                                      // label:
                                    ),
                                  ),
                                ],
                              ),
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
                                  Navigator.pushNamed(
                                    context,
                                    '/checkout',
                                  );
                                },
                                child: Text(
                                  "Checkout",
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
