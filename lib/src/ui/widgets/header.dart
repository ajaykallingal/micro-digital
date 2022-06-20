import 'package:flutter/material.dart';
import 'package:micro_digital/src/constants/assets.dart';



mixin Header {

  Widget getOverlayWidget({required BuildContext context,required bool isHome,bool isDashboard=false}) {
     double height = MediaQuery.of(context).size.height;
     double width =MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: Image.asset(
            'assets/images/TOP_BAR.png',
            width: double.infinity,
            height: 155,
            fit: BoxFit.cover,
          ).image,
        ),
        borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),

      ),
      height: 155,
      width: width,
      child:Padding(
        padding: EdgeInsets.only(top: height*.06,left:14,right: 14),
        child:isHome ?isDashboard? Column(
          mainAxisSize: MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(height: height*.06, child: Image.asset(Assets.logo)),
             Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 35,width: 80,
                    child: Image.asset(Assets.logo)),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children:  [
                    SizedBox(
                        height: height*.05,
                        child: const Icon(
                          Icons.location_on_rounded,
                          color: Colors.white,
                        )),
                    Text(
                      " Kerala, India",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    )
                  ],
                ),

                IconButton(onPressed: (){
                  Navigator.pushNamed(context, '/cart');
                }, icon: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Image.asset(Assets.iconCart),
                ))
              ],
            ),
          ],
        ):Padding(
      padding: const EdgeInsets.only(top:18.0),
      child: Align(alignment: Alignment.topLeft,child: IconButton(onPressed: (){Navigator.of(context).pop();},icon: Icon(Icons.close,color: Colors.white,),)
        ,),
    ):Container(),
      ),
    );
  }

  Widget getSearchWidget({required BuildContext context,required TextEditingController textEditingController,required ValueChanged<String> onSubmitted}) {
    double width = MediaQuery.of(context).size.width;
    return Align(alignment: const Alignment(0, -0.70),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 35),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(blurRadius: 9, offset: Offset(0, 0), color: Colors.grey)
          ],
          color: Colors.white,
        ),
        height: 50.0,
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 9.0),
                  child: SizedBox(
                      height: 24, width: 24, child: Image.asset(Assets.iconSearch)),
                ),
                 Container(width: width*.5,
                   child: TextField(
                     controller: textEditingController,
                    autofillHints: [" Search for a test.."],decoration: InputDecoration(hintText: "Search for a test..",border: InputBorder.none),
                    style: TextStyle(color: Color(0xFF707070), fontSize: 16),
                     onSubmitted:onSubmitted,
                ),
                 )
              ],
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: VerticalDivider(
                    thickness: 2,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                SizedBox(
                    height: 24, width: 24, child: Image.asset(Assets.iconUpload)),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildHeading(
      {required String heading,
        VoidCallback? onPressed,
        required bool showViewAll}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            heading,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          showViewAll
              ? GestureDetector(
            onTap: onPressed,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "View All",
                  style: TextStyle(color: Color(0xFF26ABE2)),
                ),
                const SizedBox(
                  width: 14,
                ),
                Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                      color: Color(0xFF26ABE2),
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    size: 12,
                  ),
                ),
              ],
            ),
          )
              : Container(),
        ],
      ),
    );
  }

  SizedBox buildSpaceWidget() => const SizedBox(
    height: 20,
  );

  SizedBox buildRecommendedPackages() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
          itemCount: 6,
          scrollDirection: Axis.horizontal,physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Center(
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
                height: 130.0,
                width: MediaQuery.of(context).size.width * .85,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Master Health Checkup",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w700),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Includes ',
                                style: TextStyle(
                                    color: const Color(0xFF000000)
                                        .withOpacity(.49)),
                              ),
                              const TextSpan(
                                text: '  80 Tests',
                                style: TextStyle(color: Color(0xFF26ABE2)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Flexible(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Recommended for",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color:
                                        Color(0xFF000000).withOpacity(.49)),
                                  ),
                                  const Text(
                                    "Male, Female",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF000000),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              thickness: 2,
                              width: 2,
                              color: Colors.grey.shade300,
                            ),
                            Flexible(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Age Group",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color:
                                        Color(0xFF000000).withOpacity(.49)),
                                  ),
                                  Text(
                                    "After 35",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF000000),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              thickness: 2,
                              width: 2,
                              color: Colors.grey.shade300,
                            ),
                            Flexible(
                              child: Container(
                                height: 30,
                                width: 76,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(14)),
                                    color: Color(0xFF26ABE2)),
                                child: Center(
                                    child: Text(
                                      "Details",
                                      style: TextStyle(
                                          fontSize: 16, color: Color(0xFFFFFFFF)),
                                    )),
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
          }),
    );
  }

}