import 'package:flutter/material.dart';
import 'package:micro_digital/src/data/bloc/profile_bloc.dart';

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

  TextEditingController firstNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  String? restorationId = 'main';
  String dobDropdown = "DOB";
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

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  // }

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
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                        child: Container(
                          width: double.infinity,
                          height: 100,
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                            child: ListView(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 20, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Name',
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle1
                                                .override(
                                                  fontFamily: 'Titillium Web',
                                                  color: Color(0xFF26ABE2),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 20, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Relation',
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle1
                                                .override(
                                                  fontFamily: 'Titillium Web',
                                                  color: Color(0xFF26ABE2),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          // SizedBox(width: 100),
                                          Flexible(
                                            child: TextButton(
                                                onPressed: () {},
                                                child: Text("self")),
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 20, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Date of Birth',
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle1
                                                .override(
                                                  fontFamily: 'Titillium Web',
                                                  color: Color(0xFF26ABE2),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          // SizedBox(width: 100),

                                          Flexible(
                                            child: TextField(
                                              enabled: false,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                suffixIcon: ImageIcon(
                                                  AssetImage(
                                                      "assets/icons/calendar 2.png"),
                                                ),
                                              ),
                                              onTap: () {
                                                _restorableDatePickerRouteFuture
                                                    .present();
                                              },
                                            ),
                                            // TextButton(
                                            //   onPressed: () {
                                            //     _restorableDatePickerRouteFuture.present();
                                            //
                                            //   },
                                            //   child: ImageIcon(
                                            //     AssetImage(
                                            //         "assets/icons/calendar 2.png"),
                                            //   ),
                                            // ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
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
        ),
      ),
    );
  }

  Widget buildDobSelector({
    required TextEditingController textEditingController,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTapDown: (TapDownDetails details) {
          FocusManager.instance.primaryFocus?.unfocus();
          showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2015, 8),
            lastDate: DateTime(2015, 8),
          );
          // DatePicker.showDateTimePicker(
          //   context,
          //   showTitleActions: true,
          //   minTime: DateTime(1900, 1, 1),
          //   maxTime: DateTime.now(),
          //   theme: const DatePickerTheme(
          //     // headerColor: AppColors.buttonColor,
          //     backgroundColor: Colors.white,
          //     itemStyle: TextStyle(
          //         color: Colors.black,
          //         fontWeight: FontWeight.bold,
          //         fontSize: 18),
          //     doneStyle: TextStyle(color: Colors.black87, fontSize: 16),
          //   ),
          //   onChanged: (date) {},
          //   onConfirm: (date) {
          //     setState(() {
          //       dobController.text = DateFormat('yyyy-MM-dd').format(date);
          //       // _dobController.text = date.toString();
          //     });
          //   },
          //   currentTime: DateTime.now(),
          // );
        },
        child: Row(
          children: [
            Expanded(
              flex: 9,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextField(
                  style: const TextStyle(color: Colors.black),
                  // readOnly:  isReadOnly,
                  controller: textEditingController,
                  enabled: false,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(5),
                    border: InputBorder.none,
                    // label: Text(labelText),
                  ),
                ),
              ),
            ),
            const Flexible(child: Icon(Icons.arrow_drop_down))
          ],
        ),
      ),
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
