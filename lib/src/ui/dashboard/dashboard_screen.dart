import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:micro_digital/src/constants/assets.dart';
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
      setState(() {
        imageSliders = List.generate(
            event.banners.length,
            (index) => SizedBox(
                  height: 100,
                  child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12.0)),
                      child: Image.network(
                        event.banners[index].imageDir,
                        fit: BoxFit.fill,
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                      )),
                ));
        latestPackageList = event.latest;
        riskAreaList = event.riskAreas;
        // brandList =event.b;
        // recommendedPackageList = event.r
        popularPackageList = event.popular;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    masterBloc.getDashboardData();
    searchBloc.searchTest(
        request: SearchRequest(query: searchTextController.text, pageNo: "1"));
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
          getScrollableBody(),
          // This container will work as Overlay
          getOverlayWidget(context: context, isHome: true, isDashboard: true),
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
          ),
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
            buildPackages(),
            buildSpaceWidget(),
            buildHeading(
                heading: "Risk Areas", onPressed: () {}, showViewAll: true),
            buildSpaceWidget(),
            buildRiskAreaListView(),
            buildSpaceWidget(),
            buildHeading(
                heading: "Our Brands", onPressed: () {}, showViewAll: false),
            buildSpaceWidget(),
            buildBrandListView(),
            buildSpaceWidget(),
            buildHeading(
                heading: "My Dashboard", onPressed: () {}, showViewAll: false),
            buildSpaceWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: Image.asset(Assets.imageCovid),
              ),
            ),
            buildSpaceWidget(),
            buildHeading(
                heading: "Recommended Packages",
                onPressed: () {},
                showViewAll: true),
            buildSpaceWidget(),
            buildRecommendedTestListView(),
            buildSpaceWidget(),
            buildHeading(
                heading: "Popular Tests", onPressed: () {}, showViewAll: true),
            buildSpaceWidget(),
            buildPopularTestListView(),
            buildSpaceWidget(),
            buildSpaceWidget(),
            buildSpaceWidget(),
          ],
        ),
      ),
    );
  }

  SizedBox buildPackages() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          itemCount: latestPackageList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/package_details');
              },
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(
                    left: index == 0 ? 23 : 15,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 4,
                          offset: Offset(0, 0),
                          color: Colors.grey.withOpacity(.4))
                    ],
                    color: Colors.white,
                  ),
                  height: 189.0,
                  width: 180,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 150,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ClipRRect(
                            child: Image.network(
                              latestPackageList[index].imageDir,
                              scale: 7,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                      ),
                      Text(
                        latestPackageList[index].product,
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Titillium Web',
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  SizedBox buildRiskAreaListView() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
          itemCount: riskAreaList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Center(
              child: Container(
                margin: EdgeInsets.only(
                  left: index == 0 ? 23 : 15,
                ),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 4,
                        offset: Offset(0, 0),
                        color: Colors.grey.withOpacity(.4))
                  ],
                  color: Colors.white,
                ),
                height: 126.0,
                width: 116,
                child: Center(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                        height: 60,
                        width: 60,
                        child: Image.network(riskAreaList[index].imageDir)),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      riskAreaList[index].category,
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
