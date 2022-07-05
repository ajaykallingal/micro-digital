import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:micro_digital/src/data/bloc/profile_bloc.dart';
import 'package:micro_digital/src/data/model/profile/create_profile/create_profile_request.dart';

import '../../data/model/profile/create_profile/create_profile_response.dart';
import '../../data/shared_pref/object_factory.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';

class AddMemberScreen extends StatefulWidget {
  const AddMemberScreen({Key? key}) : super(key: key);

  @override
  State<AddMemberScreen> createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen>
    with RestorationMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final profileBloc = ProfileBloc();
  bool loading = false;
  CreateProfileResponse? createProfileResponse;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  String? restorationId = 'main';
  String dobDropdown = "DOB";
  String dropdownValue = "self";
  bool isMaleChecked = false;
  bool isFemaleChecked = false;
  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(2021, 7, 25));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2021),
          lastDate: DateTime(2022),
        );
      },
    );
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        // Flexible(
        //   child: Text(
        //       'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
        // );
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text(
        //       'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
        // ));
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    profileBloc.createProfileSCListener.listen((event) {
      createProfileResponse = event;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/background.jpg',
                    ).image,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 155,
                      decoration: BoxDecoration(),
                      child: Stack(
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
                              fit: BoxFit.fill,
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 60,
                                      icon: Icon(
                                        Icons.arrow_back_rounded,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                    Text(
                                      'Add Member',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Titillium Web',
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Container(
                                      width: 50,
                                      height: 0,
                                      decoration: BoxDecoration(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                            child: Container(
                              width: double.infinity,
                              // height: ,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 13,
                                    color: Color(0x1C000000),
                                    offset: Offset(0, 1),
                                    spreadRadius: 1,
                                  )
                                ],
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 0, 0),
                                child: ListView(
                                  physics: BouncingScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 20, 0),
                                          child: Row(
                                            // mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Name',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily:
                                                              'Titillium Web',
                                                          color:
                                                              Color(0xFF26ABE2),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              SizedBox(width: 100),
                                              Flexible(
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          height: 1,
                                          endIndent: 15,
                                          thickness: 0.1,
                                          color: Color(0xFF010101),
                                        ),
                                        SizedBox(height: 8),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 8, 0),
                                          child: Row(
                                            // mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Relation',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily:
                                                              'Titillium Web',
                                                          color:
                                                              Color(0xFF26ABE2),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              // SizedBox(width: 100),
                                              Flexible(
                                                child:
                                                    DropdownButtonHideUnderline(
                                                  child: DropdownButton<String>(
                                                    value: dropdownValue,
                                                    // iconSize: 15,
                                                    iconDisabledColor:
                                                        Colors.black,
                                                    iconEnabledColor:
                                                        Color(0xFF26ABE2),
                                                    icon: Icon(
                                                      Icons
                                                          .arrow_drop_down_sharp,
                                                    ),
                                                    elevation: 16,
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                    onChanged:
                                                        (String? newValue) {
                                                      setState(() {
                                                        dropdownValue =
                                                            newValue!;
                                                      });
                                                    },
                                                    items: <String>[
                                                      'self',
                                                      'father',
                                                      'mother',
                                                      'sister'
                                                    ].map<
                                                            DropdownMenuItem<
                                                                String>>(
                                                        (String value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: value,
                                                        child: Text(value),
                                                        // alignment: Alignment.centerRight,
                                                      );
                                                    }).toList(),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          height: 1,
                                          endIndent: 15,
                                          thickness: 0.1,
                                          color: Color(0xFF010101),
                                        ),
                                        SizedBox(height: 8),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Date of Birth',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily:
                                                              'Titillium Web',
                                                          color:
                                                              Color(0xFF26ABE2),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              SizedBox(width: 110),
                                              Flexible(
                                                child: buildDobSelector(
                                                    textEditingController:
                                                        dobController),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          height: 1,
                                          endIndent: 15,
                                          thickness: 0.1,
                                          color: Color(0xFF010101),
                                        ),
                                        SizedBox(height: 8),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 20, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Gender',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily:
                                                              'Titillium Web',
                                                          color:
                                                              Color(0xFF26ABE2),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 17),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 20, 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.all(8),
                                                    child: ImageIcon(
                                                      AssetImage(
                                                          "assets/icons/male.png"),
                                                      color: Color(0xFF40B5E5),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Male',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily:
                                                              'Titillium Web',
                                                          color:
                                                              Color(0xFF26ABE2),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          isMaleChecked =
                                                              !isMaleChecked;
                                                        });
                                                      },
                                                      child: isMaleChecked
                                                          ? Container(
                                                              margin: EdgeInsets
                                                                  .zero,
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              height: 20,
                                                              width: 20,
                                                              // child: Image.asset('assets/images/TICK.png',height: 30,width: 30,fit: BoxFit.cover,),
                                                              decoration:
                                                                  const BoxDecoration(
                                                                // color: Colors.white,
                                                                shape: BoxShape
                                                                    .circle,

                                                                image:
                                                                    DecorationImage(
                                                                  image: AssetImage(
                                                                      'assets/icons/radio.png'),
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                                // color: mainRedShadeForText,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                      blurRadius:
                                                                          1.5,
                                                                      color: Colors
                                                                          .black26,
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              1))
                                                                ],
                                                              ),
                                                            )
                                                          : Container(
                                                              height: 20,
                                                              width: 20,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Colors
                                                                    .white,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                      blurRadius:
                                                                          1.5,
                                                                      color: Colors
                                                                          .black38,
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              1))
                                                                ],
                                                              ),
                                                            ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: ImageIcon(
                                                      AssetImage(
                                                          "assets/icons/female.png"),
                                                      color: Color(0xFFFC3AA2),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Female',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily:
                                                              'Titillium Web',
                                                          color:
                                                              Color(0xFF26ABE2),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          isFemaleChecked =
                                                              !isFemaleChecked;
                                                        });
                                                      },
                                                      child: isFemaleChecked
                                                          ? Container(
                                                              margin: EdgeInsets
                                                                  .zero,
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              height: 20,
                                                              width: 20,
                                                              // child: Image.asset('assets/images/TICK.png',height: 30,width: 30,fit: BoxFit.cover,),
                                                              decoration:
                                                                  const BoxDecoration(
                                                                // color: Colors.white,
                                                                shape: BoxShape
                                                                    .circle,

                                                                image:
                                                                    DecorationImage(
                                                                  image: AssetImage(
                                                                      'assets/icons/radio.png'),
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                                // color: mainRedShadeForText,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                      blurRadius:
                                                                          1.5,
                                                                      color: Colors
                                                                          .black26,
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              1))
                                                                ],
                                                              ),
                                                            )
                                                          : Container(
                                                              height: 20,
                                                              width: 20,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Colors
                                                                    .white,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                      blurRadius:
                                                                          1.5,
                                                                      color: Colors
                                                                          .black38,
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              1))
                                                                ],
                                                              ),
                                                            ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 8, 0),
                                          child: Row(
                                            // mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Mobile Number',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily:
                                                              'Titillium Web',
                                                          color:
                                                              Color(0xFF26ABE2),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              SizedBox(width: 100),
                                              Flexible(
                                                child: TextField(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  controller:
                                                      mobileNumberController,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          height: 1,
                                          endIndent: 15,
                                          thickness: 0.1,
                                          color: Color(0xFF010101),
                                        ),
                                        SizedBox(height: 8),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 8, 0),
                                          child: Row(
                                            // mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Email Address',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily:
                                                              'Titillium Web',
                                                          color:
                                                              Color(0xFF26ABE2),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              SizedBox(width: 100),
                                              Flexible(
                                                child: TextField(
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  controller: emailController,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          height: 1,
                                          endIndent: 15,
                                          thickness: 0.1,
                                          color: Color(0xFF010101),
                                        ),
                                        SizedBox(height: 8),
                                      ],
                                    ),
                                  ],
                                ),
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
                                            color: Color(0x004B39EF),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                topLeft: Radius.circular(20))),
                                        width:
                                            MediaQuery.of(context).size.width,
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
                                            profileBloc.createProfile(
                                              request: CreateProfileRequest(
                                                userId: ObjectFactory()
                                                    .prefs
                                                    .getUserId()
                                                    .toString(),
                                                profileType: "s",
                                                sFirstname:
                                                    firstNameController.text,
                                                sLastname: "sLastname",
                                                sAddress: "sAddress",
                                                sAddress2: "sAddress2",
                                                sCity: "sCity",
                                                sState: "sState",
                                                sCountry: "sCountry",
                                                sZipcode: "sZipcode",
                                                sPhone:
                                                    mobileNumberController.text,
                                                sAddressType: "sAddressType",
                                                profileName: "profileName",
                                              ),
                                            );
                                            Navigator.pushNamed(
                                                context, "/profile");
                                          },
                                          child: Text(
                                            "Add Member",
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDobSelector({
    required TextEditingController textEditingController,
    // required String dropDownName,
  }) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        FocusManager.instance.primaryFocus?.unfocus();
        DatePicker.showDatePicker(
          context,
          showTitleActions: true,
          minTime: DateTime(1900, 1, 1),
          maxTime: DateTime.now(),
          theme: const DatePickerTheme(
              // headerColor: AppColors.buttonColor,
              backgroundColor: Colors.white,
              itemStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
              doneStyle: TextStyle(color: Colors.black87, fontSize: 16)),
          onChanged: (date) {},
          onConfirm: (date) {
            setState(() {
              dobController.text = DateFormat('yyyy-MM-dd').format(date);
              // _dobController.text = date.toString();
            });
          },
          currentTime: DateTime.now(),
        );
      },
      child: TextField(
        style: const TextStyle(color: Colors.black),
        // readOnly:  isReadOnly,
        controller: textEditingController,
        enabled: false,
        decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: Image.asset(
              "assets/icons/calendar 2.png",
              scale: 2.5,
            )
            // contentPadding: const EdgeInsets.all(5),
            // border: InputBorder.none, label: Text(labelText)),
            ),
      ),
      // Container(
      //   height: 55,
      //   decoration: BoxDecoration(
      //       border: Border.all(
      //         // color: mainRedShadeForText,
      //         width: 0.4,
      //       ),
      //       borderRadius: const BorderRadius.all(Radius.circular(20))),
      //   child: Row(
      //     children: [
      //       Expanded(
      //         flex: 9,
      //         child: Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 12.0),
      //           child: ,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }
  //
  // @override
  // // TODO: implement restorationId
  // String? get restorationId => throw UnimplementedError();
}
