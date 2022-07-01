import 'package:flutter/material.dart';
import 'package:micro_digital/src/common/styles.dart';
import 'package:micro_digital/src/constants/assets.dart';
import 'package:micro_digital/src/constants/colors.dart';
import 'package:micro_digital/src/data/bloc/profile_bloc.dart';
import 'package:micro_digital/src/data/model/profile/create_profile/create_profile_request.dart';
import 'package:micro_digital/src/data/model/profile/list_my_profile/list_my_profile_response.dart';
import 'package:micro_digital/src/data/shared_pref/object_factory.dart';
import 'package:micro_digital/src/data/utils/screen_size/size_config.dart';
import 'package:micro_digital/src/ui/widgets/header.dart';

import '../flutter_flow/flutter_flow_theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with Header {
  List<String> featureNameList = [
    "My Reports",
    "My Family & Friends",
    "Complaints",
    "Contact Us",
    "Terms & Conditions",
    "Log out",
  ];

  List<String> featureIconList = [];
  late double _height;
  late double _width;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  final profileBloc = ProfileBloc();
  // ListMyProfileResponse? profileResponse;
  List<MyProfileList>? myProfileList = List.empty(growable: true);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    profileBloc.createProfileSCListener.listen((event) {
      setState(() {
        myProfileList = event.myProfileList;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    // Add code after super
    profileBloc.listMyProfile(203);
  }

  @override
  Widget build(BuildContext context) {
    featureIconList = [
      Assets.iconMyReport,
      Assets.iconMyFamilyAndFriends,
      Assets.iconComplaints,
      Assets.iconContactUs,
      Assets.iconTermsAdCondition,
      Assets.iconLogOut,
    ];
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          // The containers in the background and scrollable
          getScrollableBody(),

          // This container will work as Overlay
          SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: Stack(
              children: [
                getOverlayWidget(context: context, isHome: false),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 50),
                    child: Text(
                      "Profile",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: Stack(
              children: [
                Positioned(
                  top: 120,
                  bottom: 15,
                  left: 2,
                  right: 2,
                  child: Container(
                    padding: EdgeInsets.all(12),
                    width: _width,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 0),
                            color: Colors.grey.shade400,
                            blurRadius: 9)
                      ],
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: [
                        SizedBox(height: 50),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "Mr. John Mathews",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                            ),

                            Text(
                              "mathewjohn@gmail.com",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            // SizedBox(
                            //   height: 20,
                            // ),
                            // buildFamilyMembers(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 220,
            top: 120,
            bottom: 0,
            right: 0,
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 30,
                margin: EdgeInsets.all(8),
                child: MaterialButton(
                  padding: EdgeInsets.all(7),
                  onPressed: () {
                    showModalBottomSheet(
                        constraints: BoxConstraints(
                          maxHeight: 200,
                          maxWidth: double.infinity,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        context: context,
                        builder: (context) {
                          return Stack(
                            children: [
                              // SizedBox(height: 30),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Column(
                                        children: [
                                          SizedBox(height: 30),
                                          Text(
                                            "Name",
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle1
                                                .override(
                                                    fontFamily: 'Titillium Web',
                                                    color: mainBlueShade,
                                                    fontSize: 17),
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            height: 40,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: TextField(
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Flexible(
                                      child: Column(
                                        children: [
                                          SizedBox(height: 30),
                                          Text(
                                            "Phone",
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle1
                                                .override(
                                                    fontFamily: 'Titillium Web',
                                                    color: mainBlueShade,
                                                    fontSize: 15),
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            height: 40,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: TextField(
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                label: Text(ObjectFactory()
                                                    .prefs
                                                    .getUserPhoneNumber()
                                                    .toString()),
                                              ),
                                            ),
                                          ),
                                        ],
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                      ),
                                    )
                                  ],
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                ),
                              ),
                              Align(
                                child: ElevatedButton(
                                  onPressed: () {
                                    profileBloc.createProfile(
                                      request: CreateProfileRequest(
                                        userId: "203",
                                        profileType: "p",
                                        sFirstname: nameController.text,
                                        sLastname: "lastName",
                                        sAddress: "Address1",
                                        sAddress2: "Address2",
                                        sCity: "city",
                                        sState: "state",
                                        sCountry: "country",
                                        sZipcode: "zipcode",
                                        sPhone: phoneNumberController.text,
                                        sAddressType: "address type",
                                        profileName: "main",
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Submit",
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle1
                                        .override(
                                            fontFamily: 'Titillium Web',
                                            color: Colors.white,
                                            fontSize: 15),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(
                                        MediaQuery.of(context).size.width, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                      ),
                                    ),
                                    primary: mainBlueShade,
                                  ),
                                ),
                                alignment: Alignment.bottomCenter,
                              ),
                            ],
                          );
                        });
                  },
                  child: Image.asset(
                    "assets/icons/edit.png",
                  ),
                  // color: Colors.blue,
                  shape: CircleBorder(),
                  color: Colors.white.withOpacity(1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getScrollableBody() {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: ExactAssetImage(Assets.background))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: SizeConfig.screenHeight! * .29),
          // Container(
          //   padding: EdgeInsets.all(12),
          //   width: _width,
          //   margin: EdgeInsets.symmetric(horizontal: 30),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.all(Radius.circular(20)),
          //     boxShadow: [
          //       BoxShadow(
          //           offset: Offset(0, 0),
          //           color: Colors.grey.shade400,
          //           blurRadius: 9)
          //     ],
          //     color: Colors.white,
          //   ),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         "Mr. John Mathews",
          //         style: const TextStyle(
          //             fontSize: 20, fontWeight: FontWeight.w700),
          //       ),
          //       Text(
          //         "mathewjohn@gmail.com",
          //         style: const TextStyle(
          //             fontSize: 16, fontWeight: FontWeight.w500),
          //       ),
          //       SizedBox(
          //         height: 20,
          //       ),
          //       buildFamilyMembers(),
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 40.0),
          //   child: Align(
          //     alignment: Alignment.centerLeft,
          //     child: Row(
          //       children: [
          //         Flexible(
          //           flex: 1,
          //           child: SizedBox(
          //               height: 100,
          //               width: 100,
          //               child: ClipRRect(
          //                   borderRadius:
          //                       BorderRadius.all(Radius.circular(100)),
          //                   child: Image.network(
          //                     "https://expertphotography.b-cdn.net/wp-content/uploads/2018/10/cool-profile-pictures-retouching-1.jpg",
          //                     fit: BoxFit.cover,
          //                   ))),
          //         ),
          //         Expanded(
          //           flex: 2,
          //           child: Padding(
          //             padding: const EdgeInsets.only(left: 18.0),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text(
          //                   "Mr. John Mathews",
          //                   style: const TextStyle(
          //                       fontSize: 20, fontWeight: FontWeight.w700),
          //                 ),
          //                 Text(
          //                   "mathewjohn@gmail.com",
          //                   style: const TextStyle(
          //                       fontSize: 16, fontWeight: FontWeight.w500),
          //                 ),
          //                 Text(
          //                   "01/06/1880",
          //                   style: const TextStyle(
          //                       fontSize: 16, fontWeight: FontWeight.w500),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          SizedBox(height: SizeConfig.screenHeight! * .02),
          Expanded(
              child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 0),
                    color: Colors.grey.shade400,
                    blurRadius: 9)
              ],
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 26.0),
                    //   child: Text(
                    //     "Switch to family member",
                    //     style: const TextStyle(
                    //         fontSize: 20, fontWeight: FontWeight.w600),
                    //   ),
                    // ),

                    // buildFamilyMembers(),
                    // Divider(),
                    buildFeatures(),
                    SizedBox(
                      height: 60,
                    )
                  ],
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }

  Widget buildFamilyMembers() {
    return SizedBox(
      height: _height * .08,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(6, (index) {
          return Row(
            children: [
              index == 0
                  ? Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        width: 144,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.accentColor),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              size: 33,
                              color: AppColors.accentColor,
                            ),
                            Text("Add Family\nMember",
                                textAlign: TextAlign.center)
                          ],
                        ),
                      ),
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                  width: 120,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.accentColor),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("James Alvy \nFather", textAlign: TextAlign.center),
                    ],
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }

  Widget buildFeatures() {
    return Padding(
      padding: const EdgeInsets.only(left: 26.0),
      child: Wrap(
        children: List.generate(
            5,
            (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Container(
                          width: _height * .07,
                          height: _height * .07,
                          decoration: BoxDecoration(
                              // color: Color(0xFFDBDBDB),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14))),
                          child: Center(
                            child: Image.asset(
                              featureIconList[index],
                              fit: BoxFit.cover,
                              width: _height * .03,
                              height: _height * .03,
                              // color: Color(0xFF535353),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 24.0),
                            child: Text(
                              featureNameList[index],
                              style: TextStyle(
                                  color: Color(0xFF535353),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          onTap: () {
                            // Navigator.of(context).push('');
                          },
                        ),
                      )
                    ],
                  ),
                )),
      ),
    );
  }
}
