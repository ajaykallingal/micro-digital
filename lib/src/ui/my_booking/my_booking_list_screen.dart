import 'package:flutter/material.dart';
import 'package:micro_digital/src/common/route_generator.dart';
import 'package:micro_digital/src/constants/assets.dart';
import 'package:micro_digital/src/data/bloc/booking_bloc.dart';
import 'package:micro_digital/src/data/model/my_booking/my_booking_request.dart';
import 'package:micro_digital/src/data/model/my_booking/my_booking_response.dart';
import 'package:micro_digital/src/data/utils/screen_size/size_config.dart';
import 'package:micro_digital/src/ui/widgets/header.dart';

class MyBookingListScreen extends StatefulWidget {
  const MyBookingListScreen({Key? key}) : super(key: key);

  @override
  _MyBookingListScreenState createState() => _MyBookingListScreenState();
}

class _MyBookingListScreenState extends State<MyBookingListScreen> with Header {
  late double _height;
  late double _width;

  final bookingBloc = BookingBloc();
  List<BookingHistory> bookingHistory = List.empty(growable: true);

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    bookingBloc.getBookingListSCListener.listen((event) {
      setState(() {
        bookingHistory = event.bookingHistory!;
      });
    });

    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    bookingBloc.getBookingList(
        request: MyBookingRequest(userId: "103", pageNo: "1"));
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          // The containers in the background and scrollable
          getScrollableBody(),

          // This container will work as Overlay
          SizedBox(
            height: MediaQuery.of(context).size.height * .2,
            child: Stack(
              children: [
                getOverlayWidget(context: context, isHome: false),
                const Center(
                  child: Text(
                    "My Bookings",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
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
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .2,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                    bookingHistory.length,
                    (index) => InkWell(
                      onTap: ()=>Navigator.pushNamed(context, RouteGenerator.bookingDetailPage),
                      child: Container(
                            padding: EdgeInsets.all(12),
                            width: _width,
                            margin: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 0),
                                    color: Colors.grey.shade300,
                                    blurRadius: 6)
                              ],
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Order Id: ",
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "#${bookingHistory[index].orderId}",
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      // "22-02-2022 08:10 AM",
                                      bookingHistory[index].deliveryDate,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Customer: ",
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          bookingHistory[index].firstname +" "+ bookingHistory[index].lastname,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Total: ",
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          bookingHistory[index].total,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Status: ",
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      bookingHistory[index].status,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
