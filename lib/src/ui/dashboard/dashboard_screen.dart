import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:micro_digital/src/constants/assets.dart';
import 'package:micro_digital/src/constants/colors.dart';
import 'package:micro_digital/src/data/bloc/master_bloc.dart';
import 'package:micro_digital/src/data/model/dashboard/dashboard_response.dart';
import 'package:micro_digital/src/data/utils/screen_size/size_config.dart';
import 'package:micro_digital/src/ui/flutter_flow/flutter_flow_theme.dart';
import 'package:micro_digital/src/ui/widgets/header.dart';

import '../../data/bloc/search_bloc.dart';
import '../../data/model/search/search_package_response.dart';
import '../../data/model/search/search_request.dart';
import '../../data/model/search/search_test_response.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with Header {
  double _width = 0.0;
  double _height = 0.0;
  List<Widget> imageSliders = <Widget>[];
  List<String> iconList = <String>[];
  List<String> iconRiskAreaList = <String>[];
  List<String> iconBrandList = <String>[];
  List<int> iconColorList = [0xFF4485FD, 0xFFA584FF, 0xFFFF7854, 0xFFFF7854];
  List<String> routeNameList = [
    "/book_test",
    "/test_info",
    "/package_category",
    "/my_reports"
  ];
  List<String> iconNameList = [
    "Book a Test",
    "Test Info",
    "Package",
    "My Reports"
  ];
  List<String> iconRiskAreaNameList = ["Arthritis", "Alcoholism", "Junk Food"];

  List<Latest> latestPackageList = List.empty(growable: true);
  List<CategoryList> riskAreaList = List.empty(growable: true);
  List<CategoryList> categoryList = List.empty(growable: true);
  List<ActiveScreeningType> activeScreeningList = List.empty(growable: true);
  List<String> brandList = List.empty(growable: true);
  List<Latest> recommendedPackageList = List.empty(growable: true);
  List<Latest> popularPackageList = List.empty(growable: true);

  final masterBloc = MasterBloc();
  final searchBloc = SearchBloc();
  List<Test> tests = List.empty(growable: true);
  List<Package> package = List.empty(growable: true);
  TextEditingController searchTextController = TextEditingController();
  int currentTabIndex = 0;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

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

    masterBloc.getDashboardSCListener.listen((event) {
      if(mounted) {
        setState(() {
          imageSliders = List.generate(
              event.banners.length,
                  (index) =>
                  SizedBox(
                    height: 100,
                    child: ClipRRect(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(12.0)),
                        child: Image.network(
                          event.banners[index].imageDir,
                          fit: BoxFit.fill,
                          height: 100,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                        )),
                  ));
          latestPackageList = event.latest;
          riskAreaList = event.riskAreas;
          categoryList = event.categoryList;
          activeScreeningList = event.activeScreeningTypes;

          // brandList =event.b;
          // recommendedPackageList = event.r
          popularPackageList = event.popular;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    masterBloc.getDashboardData();
    // searchBloc.searchTest(
    //     request: SearchRequest(query: searchTextController.text, pageNo: "1"));
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    SizeConfig().init(context);
    iconList = [
      Assets.iconBookTest,
      Assets.iconTestInfo,
      Assets.iconPackages,
      Assets.iconMyReports
    ];
    iconRiskAreaList = [
      Assets.iconArthritis,
      Assets.iconDrunk,
      Assets.iconFood
    ];
    iconBrandList = [
      Assets.iconBrand1,
      Assets.iconBrand2,
      Assets.iconBrand3,
      Assets.iconBrand4
    ];
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
      backgroundColor: Colors.white,
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
                        bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
                // 3
                expandedHeight: 100.0,automaticallyImplyLeading: false,
                // 4
                pinned: false,
                elevation: 0,
                // 5
                flexibleSpace: FlexibleSpaceBar(titlePadding: EdgeInsets.only(left:0 , bottom:0 ),
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
                          bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),

                    ),
                    height: 100,
                    width: _width,
                    child:Padding(
                      padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 20),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(height: 35,width: 50,
                                child: Image.asset(Assets.logo)),
                            // Row(
                            //   mainAxisSize: MainAxisSize.min,
                            //   children:  [
                            //     SizedBox(
                            //         height: _height*.05,
                            //         child: const Icon(
                            //           Icons.location_on_rounded,
                            //           color: Colors.white,
                            //         )),
                            //     Text(
                            //       " Kerala, India",
                            //       style: TextStyle(color: Colors.white, fontSize: 17),
                            //     )
                            //   ],
                            // ),

                            IconButton(onPressed: (){
                              Navigator.pushNamed(context, '/cart');
                            }, icon: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Image.asset(Assets.iconCart,width: 18,height: 18,),
                            ))
                          ],
                        ),
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
                          buildCarouselSlider(),
                          buildSpaceWidget(),
                          buildHeading(
                              heading: "Packages", onPressed: () {}, showViewAll: true),
                          buildSpaceWidget(),
                          buildPackages(latestPackageList),
                          buildSpaceWidget(),
                          buildHeading(
                              heading: "Risk Areas", onPressed: () {}, showViewAll: true),
                          buildSpaceWidget(),
                          buildCategoryListView(riskAreaList),
                          // buildSpaceWidget(),
                          // buildHeading(
                          //     heading: "Our Brands", onPressed: () {}, showViewAll: false),
                          // buildSpaceWidget(),
                          // buildBrandListView(),
                          buildSpaceWidget(),
                          activeScreeningList.isNotEmpty?Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, "/screeningDetails",arguments: activeScreeningList[0].id);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                // child: Image.asset(Assets.imageCovid),
                                child: Image.network(activeScreeningList[0].image),
                              ),
                            ),
                          ):Container(),
                          buildSpaceWidget(),
                          buildHeading(
                              heading: "Categories", onPressed: () {}, showViewAll: true),
                          buildSpaceWidget(),
                          buildCategoryListView(categoryList),
                          // buildSpaceWidget(),
                          // buildHeading(
                          //     heading: "Recommended Packages",
                          //     onPressed: () {},
                          //     showViewAll: true),
                          // buildSpaceWidget(),
                          // buildRecommendedTestListView(),
                          // buildSpaceWidget(),
                          activeScreeningList.length>1?Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, "/screeningDetails",arguments: activeScreeningList[1].id);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                // child: Image.asset(Assets.imageCovid),
                                child: Image.network(activeScreeningList[1].image),
                              ),
                            ),
                          ):Container(),
                          buildSpaceWidget(),

                          buildHeading(
                              heading: "Popular Tests", onPressed: () {}, showViewAll: true),
                          buildSpaceWidget(),
                          buildPackages(popularPackageList),
                          SizedBox(height: 80,),
                        ],
                      )),
                  childCount: 1,
                ),
              ),
            ],
          ),
          // getScrollableBody(),
          // This container will work as Overlay
          // getOverlayWidget(context: context, isHome: true, isDashboard: true),
          // Positioned(
          //   bottom: 0,
          //   top: 30,
          //   right: 2,
          //   left: 2,
          //   child: getSearchWidget(
          //       context: context,
          //       textEditingController: searchTextController,
          //       onSubmitted: (s) {
          //         if (currentTabIndex == 0) {
          //           searchBloc.searchTest(
          //               request: SearchRequest(
          //                   query: searchTextController.text, pageNo: "1"));
          //         } else {
          //           searchBloc.searchPackage(
          //               request: SearchRequest(
          //                   query: searchTextController.text, pageNo: "1"));
          //         }
          //       }),
          // ),
        ],
      ),
    );
  }

  Widget getScrollableBody() {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: ExactAssetImage(Assets.background))),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: _height * .20,
            ),
            // buildFirstRow(),
            buildCarouselSlider(),
            buildSpaceWidget(),
            buildHeading(
                heading: "Packages", onPressed: () {}, showViewAll: true),
            buildSpaceWidget(),
            buildPackages(latestPackageList),
            buildSpaceWidget(),
            buildHeading(
                heading: "Risk Areas", onPressed: () {}, showViewAll: true),
            buildSpaceWidget(),
            buildCategoryListView(riskAreaList),
            // buildSpaceWidget(),
            // buildHeading(
            //     heading: "Our Brands", onPressed: () {}, showViewAll: false),
            // buildSpaceWidget(),
            // buildBrandListView(),
            buildSpaceWidget(),
            activeScreeningList.isNotEmpty?Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                // child: Image.asset(Assets.imageCovid),
                child: Image.network(activeScreeningList[0].image),
              ),
            ):Container(),
            buildSpaceWidget(),
            buildHeading(
                heading: "Categories", onPressed: () {}, showViewAll: true),
            buildSpaceWidget(),
            buildCategoryListView(categoryList),
            // buildSpaceWidget(),
            // buildHeading(
            //     heading: "Recommended Packages",
            //     onPressed: () {},
            //     showViewAll: true),
            // buildSpaceWidget(),
            // buildRecommendedTestListView(),
            // buildSpaceWidget(),
            activeScreeningList.length>1?Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                // child: Image.asset(Assets.imageCovid),
                child: Image.network(activeScreeningList[1].image),
              ),
            ):Container(),
            buildSpaceWidget(),

            buildHeading(
                heading: "Popular Tests", onPressed: () {}, showViewAll: true),
            buildSpaceWidget(),
          buildPackages(popularPackageList),
            SizedBox(height: 80,),
          ],
        ),
      ),
    );
  }

  SizedBox buildPackages(List<Latest> packageList) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          itemCount: packageList.length,physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/package_details');
              },
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(
                    left: index == 0 ? 12 : 0,right: 10
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 4,
                          offset: Offset(0, 0),
                          color: Colors.grey.withOpacity(.4))
                    ],
                    color: Colors.white,
                  ),
                  height: 196.0,
                  width: 175,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text(
                            packageList[index].product,
                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Titillium Web',
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),maxLines: 2,overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 8,),
                          Row(
                            children: [
                              Text(
                              "Includes: ",
                                style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Titillium Web',
                            color: AppColors.backgroundColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                              ),
                              Text(
                              "${packageList[index].numberOfTestsInPackage} Tests",
                                style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Titillium Web',
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                              ),

                            ],
                          ),
                            SizedBox(height: 6,),
                        Text(
                          "+ know More ",
                          style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Titillium Web',
                            color: AppColors.backgroundColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Text(
                                  "\u20B9${packageList[index].price}",
                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Titillium Web',
                                    color: AppColors.priceColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: 8,),
                                Text(
                                  packageList[index].listPrice,
                                  style: FlutterFlowTheme.of(context).bodyText1.copyWith(
                                    fontFamily: 'Titillium Web',
                                    color: AppColors.disabledColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,decoration: TextDecoration.lineThrough,decorationColor: Colors.red
                                  ),
                                ),



                              ],
                            ),

                          ],
                        ),
                      ),
                      Positioned(bottom: 0,left: 0,right: 0,
                          child: Column(
                            children: [
                              DottedBorder(
                                  child: Row(
                                mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "EXCLUSIVE OFFER",
                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Titillium Web',
                                    color: Colors.black,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "USE CODE ",
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                        fontFamily: 'Titillium Web',
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Text(
                                      "FIRST70",
                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                        fontFamily: 'Titillium Web',
                                        color: AppColors.backgroundColor,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],),color: AppColors.buttonColor,),
                              Row(
                                children: [
                                  Expanded(child: Container(
                                    decoration: BoxDecoration(color: AppColors.buttonColor,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))),child: Padding(
                                    padding: const EdgeInsets.all(9.0),
                                    child: Center(child: Text("Book Now",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),)),
                                  ),)),
                                ],
                              )


                            ],
                          ))
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  SizedBox buildCategoryListView(List<CategoryList> categoryList) {
    return SizedBox(
      height: 125,
      child: ListView.builder(
          itemCount: categoryList.length,physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Center(
              child: Container(
                margin: EdgeInsets.only(
                  left: index == 0 ? 12 : 0,right: 10
                ),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4,
                        offset: Offset(0, 0),
                        color: Colors.grey.withOpacity(.4))
                  ],
                  color: Colors.white,
                ),
                height: 100,
                width: 100,
                child: Center(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                        height: 45,
                        width: 45,
                        child: Image.network(categoryList[index].imageDir)),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      categoryList[index].category,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF727272)),
                    )
                  ],
                )),
              ),
            );
          }),
    );
  }

  SizedBox buildBrandListView() {
    return SizedBox(
      height: 55,
      child: ListView.builder(
          itemCount: brandList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              height: 55,
              width: 120,
              margin: EdgeInsets.only(
                left: index == 0 ? 20 : 0,
              ),
              child: Image.network(
                brandList[index],
                fit: BoxFit.fill,
              ),
            );
          }),
    );
  }

  Widget buildRecommendedTestListView() {
    return SizedBox(
      height: 275,
      child: ListView.builder(
          itemCount: recommendedPackageList.length,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Center(
              child: Container(
                margin: EdgeInsets.only(
                  left: index == 0 ? 23 : 15,
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4,
                        offset: Offset(0, 0),
                        color: Colors.grey.withOpacity(.4))
                  ],
                  color: Colors.white,
                ),
                height: 210,
                width: 180,
                child: Column(
                  children: [
                    SizedBox(
                      height: 85,
                      width: 180,
                      child: ClipRRect(
                        child: Image.network(
                          recommendedPackageList[index].imageDir,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(16),
                            topLeft: Radius.circular(16)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(recommendedPackageList[index].product,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF505050),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Divider(
                        height: 2,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Total Test :",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xFF000000).withOpacity(.49),
                            )),
                        Text(
                            "${recommendedPackageList[index].numberOfTestsInPackage}Tests",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Color(0xFF006F9D).withOpacity(.49),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "INR ${recommendedPackageList[index].price}",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color: Color(0xFF1D8330),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Expanded(
                    //     child: Container(
                    //   decoration: const BoxDecoration(
                    //       borderRadius: BorderRadius.only(
                    //           bottomLeft: Radius.circular(16),
                    //           bottomRight: Radius.circular(16)),
                    //       color: Color(0xFF26ABE2)),
                    //   child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    //     children: const [
                    //       Icon(Icons.add_shopping_cart,color: Colors.white,),
                    //       Text(
                    //         "  Add to Cart",
                    //         style: TextStyle(
                    //           fontWeight: FontWeight.w800,
                    //           fontSize: 16,
                    //           color: Color(0xFFFFFFFF),
                    //         ),
                    //         textAlign: TextAlign.center,
                    //       )
                    //     ],
                    //   ),
                    // ))
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget buildPopularTestListView() {
    return SizedBox(
      height: 275,
      child: ListView.builder(
          itemCount: popularPackageList.length,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Center(
              child: Container(
                margin: EdgeInsets.only(
                  left: index == 0 ? 23 : 15,
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4,
                        offset: Offset(0, 0),
                        color: Colors.grey.withOpacity(.4))
                  ],
                  color: Colors.white,
                ),
                height: 210,
                width: 180,
                child: Column(
                  children: [
                    SizedBox(
                      height: 85,
                      width: 180,
                      child: ClipRRect(
                        child: Image.network(
                          popularPackageList[index].imageDir,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(16),
                            topLeft: Radius.circular(16)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(popularPackageList[index].product,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF505050),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Divider(
                        height: 2,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Total Test :",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xFF000000).withOpacity(.49),
                            )),
                        Text(
                            "${popularPackageList[index].numberOfTestsInPackage}Tests",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Color(0xFF006F9D).withOpacity(.49),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "INR ${popularPackageList[index].price}",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color: Color(0xFF1D8330),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Expanded(
                    //     child: Container(
                    //   decoration: const BoxDecoration(
                    //       borderRadius: BorderRadius.only(
                    //           bottomLeft: Radius.circular(16),
                    //           bottomRight: Radius.circular(16)),
                    //       color: Color(0xFF26ABE2)),
                    //   child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    //     children: const [
                    //       Icon(Icons.add_shopping_cart,color: Colors.white,),
                    //       Text(
                    //         "  Add to Cart",
                    //         style: TextStyle(
                    //           fontWeight: FontWeight.w800,
                    //           fontSize: 16,
                    //           color: Color(0xFFFFFFFF),
                    //         ),
                    //         textAlign: TextAlign.center,
                    //       )
                    //     ],
                    //   ),
                    // ))
                  ],
                ),
              ),
            );
          }),
    );
  }

  SizedBox buildCarouselSlider() {
    return SizedBox(
      height: getProportionateScreenHeight(180),
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.75,
          enlargeCenterPage: true,
        ),
        items: imageSliders,
      ),
    );
  }

  SizedBox buildFirstRow() {
    return SizedBox(
      height: _height * .2,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
            4,
            (index) => Flexible(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, routeNameList[index]);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: getProportionateScreenHeight(61),
                          width: getProportionateScreenHeight(61),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(19)),
                            color: Color(iconColorList[index]),
                          ),
                          child: Center(
                            child: SizedBox(
                                height: getProportionateScreenHeight(31),
                                width: getProportionateScreenWidth(31),
                                child: Image.asset(
                                  iconList[index],
                                  fit: BoxFit.contain,
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(iconNameList[index]),
                      ],
                    ),
                  ),
                )),
      ),
    );
  }
}
