import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:micro_digital/src/constants/assets.dart';
import 'package:micro_digital/src/data/utils/screen_size/size_config.dart';
import 'package:micro_digital/src/ui/book_a_test/book_test_screen.dart';
import 'package:micro_digital/src/ui/dashboard/dashboard_screen.dart';
import 'package:micro_digital/src/ui/my_booking/my_booking_list_screen.dart';
import 'package:micro_digital/src/ui/profile/profile_screen.dart';
import 'package:micro_digital/src/ui/view_packages/view_packages_widget.dart';


class HomeNavigation extends StatefulWidget {
  final int index;

  const HomeNavigation({Key? key, required this.index}) : super(key: key);

  @override
  _HomeNavigationState createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  int currentIndex = 0;
  List<String> iconList = [];

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    iconList = [
      Assets.iconHome,
      Assets.iconReport,
      Assets.bookATest,
      Assets.iconMenu,
      Assets.iconProfile
    ];
  }

  final List<Widget> _children = [
    DashboardScreen(),
    MyBookingListScreen(),
    BookTestScreen(),
    // TestScreen(),
    // CartScreen(),
    // AddMemberScreen(),
    ViewPackagesWidget(),
    // MybookingsWidget(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white.withAlpha(55),
      body: Stack(
        children: [
          _children[currentIndex],
          Positioned(
            bottom: 20,
            left: 20,right: 20,
            child: Container(
              width: size.width,
              height: 60,
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(12),boxShadow: [BoxShadow(color: Colors.black26,blurRadius: 2)]),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                    4,
                        (index) =>Expanded(
                          child: InkWell(
                      onTap: () => setBottomBarIndex(index),
                      splashColor: Colors.black26,focusColor: Colors.red,highlightColor: Colors.green,
                      child: Container(

                       // color: Colors.grey,
                          child: Center(
                            child: SizedBox(
                                height: currentIndex == index
                                    ? getProportionateScreenHeight(24)
                                    : getProportionateScreenHeight(20),
                                width: currentIndex == index
                                    ? getProportionateScreenHeight(24)
                                    : getProportionateScreenHeight(20),
                                // child: Image.asset(
                                //   iconList[index],
                                //   fit: BoxFit.contain,
                                //   color: currentIndex == index ? Colors.blueAccent : Colors.grey.shade400,
                                // )),
                                child: SvgPicture.asset(
                                  iconList[index],
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.cover,
                                  color: currentIndex == index
                                      ? Colors.blueAccent
                                      : Colors.grey.shade400,
                                )),
                          ),
                      ),
                    ),
                        )),
              ),
            ),
            // child: Container(
            //   width: size.width,
            //   height: 60,
            //   child: Stack(
            //     clipBehavior: Clip.none,
            //     children: [
            //       // CustomPaint(
            //       //   size: Size(size.width, 80),
            //       //   painter: BNBCustomPainter(),
            //       // ),
            //       // Center(
            //       //   heightFactor: 0.6,
            //       //   child: FloatingActionButton(
            //       //       backgroundColor: Color(0xFF26ABE2),
            //       //       child: SizedBox(
            //       //           height: 25,
            //       //           width: 25,
            //       //           child: SvgPicture.asset(
            //       //             Assets.bookATest,
            //       //             width: 20,
            //       //             height: 20,
            //       //             fit: BoxFit.cover,
            //       //             color: Colors.white,
            //       //           )),
            //       //       elevation: 0.1,
            //       //       onPressed: () {
            //       //         setState(() {
            //       //           currentIndex = 2;
            //       //         });
            //       //       }),
            //       // ),
            //
            //     ],
            //   ),
            // ),
          )
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 10); //
    // Start
    path.moveTo(size.width * 0.40, 10); // Start
    // path.moveTo(size.width * 0.4, 20); // Start
    // path.moveTo(size.width * 0.4, 20); // Start
    // path.quadraticBezierTo(size.width * 0.10, 0, size.width * 0.35, 0);
    // path.quadraticBezierTo(size.width * 0.30, -33, size.width * 0.40, 20);
    path.conicTo(size.width * .35, -20, size.width * .4, 10, 0);
    path.arcToPoint(
      Offset(size.width * 0.60, 25),
      radius: const Radius.circular(1.0),
      clockwise: true,
    );
    // path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.conicTo(size.width * .6, 20, size.width * .65, 30, 0);

    // path.quadraticBezierTo(size.width * 0.60, 10, size.width*.65, 10,);
    path.moveTo(size.width, 10); // Start
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 10);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
