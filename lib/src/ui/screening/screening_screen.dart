

import 'package:flutter/material.dart';
import 'package:micro_digital/src/constants/assets.dart';
import 'package:micro_digital/src/constants/colors.dart';
import 'package:micro_digital/src/data/bloc/screening_bloc.dart';
import 'package:micro_digital/src/data/model/screening/screening_request.dart';
import 'package:micro_digital/src/data/utils/utils.dart';

enum Screening { breastCancer, cervicalCancer }
class ScreeningScreen extends StatefulWidget {
  final String screeningType;
  const ScreeningScreen({Key? key,required this.screeningType}) : super(key: key);

  @override
  _ScreeningScreenState createState() => _ScreeningScreenState();
}

class _ScreeningScreenState extends State<ScreeningScreen> {
  TextEditingController _nameTextEditController = TextEditingController();
  TextEditingController _phoneTextEditController = TextEditingController();
  TextEditingController _noteTextEditController = TextEditingController();

  Screening selected = Screening.breastCancer;
  late Size _screenSize;

  static const String breastCancerType = "1";
  static const String cervicalCancerType = "2";

  late String selectedType;

  ScreeningBloc screeningBloc = ScreeningBloc();

  @override
  void initState() {
    super.initState();
selectedType = widget.screeningType;
  }

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,appBar: AppBar(),
      // resizeToAvoidBottomInset : false,
      bottomNavigationBar: Container(
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
                      if(_nameTextEditController.text.isNotEmpty && _phoneTextEditController.text.isNotEmpty && _noteTextEditController.text.isNotEmpty) {
                        screeningBloc.screeningRequest(
                            request: ScreeningRequest(
                                name: _nameTextEditController.text,
                                phone: _phoneTextEditController.text,
                                notes: _noteTextEditController.text,
                                type: widget.screeningType,
                                requestFrom: "2"));
                      }else if(_nameTextEditController.text.isEmpty){
                        showToast("Enter name");

                      }else if(_phoneTextEditController.text.isEmpty){
                        showToast("Enter phone number");

                      }else if(_noteTextEditController.text.isEmpty){
                        showToast("Enter any note");
                      }
                      // cartBloc.addToCart(request: AddToCartRequest(productId: "494",userId: "134",productPrice: "1500.00"));
                    },
                    child: Text(
                      "Submit",
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
      body: Stack(
      children: [
        screeningBody(),

        // Positioned(
        //   bottom: 0,
        //   child: Container(
        //     // height: 174,
        //     decoration: BoxDecoration(
        //       color: Color(0xFF26ABE2),
        //       borderRadius: BorderRadius.only(
        //         topLeft: Radius.circular(20),
        //         topRight: Radius.circular(20),
        //       ),
        //       boxShadow: [
        //         BoxShadow(
        //           offset: Offset(0, -15),
        //           blurRadius: 20,
        //           color: Color(0xFFDADADA).withOpacity(0.25),
        //         )
        //       ],
        //     ),
        //     child: Row(
        //       children: [
        //         Container(
        //           decoration: BoxDecoration(
        //               color: Color(0xFF26ABE2),
        //               boxShadow: [
        //                 BoxShadow(
        //                     color: Colors.black12,
        //                     blurRadius: 2,
        //                     offset: Offset(0, -2))
        //               ],
        //               borderRadius: BorderRadius.only(
        //                   topRight: Radius.circular(20),
        //                   topLeft: Radius.circular(20))),
        //           child: SafeArea(
        //             top: false,
        //             right: false,
        //             bottom: true,
        //             left: false,
        //             child: Container(
        //               decoration: BoxDecoration(
        //                   color: Color(0x004B39EF),
        //                   borderRadius: BorderRadius.only(
        //                       topRight: Radius.circular(20),
        //                       topLeft: Radius.circular(20))),
        //               width: MediaQuery.of(context).size.width,
        //               // ignore: deprecated_member_use
        //               child: FlatButton(
        //                 height: 50,
        //                 shape: RoundedRectangleBorder(
        //                   // borderRadius: BorderRadius.circular(20.0),
        //                   borderRadius: BorderRadius.only(
        //                       topLeft: Radius.circular(20),
        //                       topRight: Radius.circular(20)),
        //                 ),
        //                 color: Color(0x004B39EF),
        //                 onPressed: () {
        //                   if(_nameTextEditController.text.isNotEmpty && _phoneTextEditController.text.isNotEmpty && _noteTextEditController.text.isNotEmpty) {
        //                     screeningBloc.screeningRequest(
        //                         request: ScreeningRequest(
        //                             name: _nameTextEditController.text,
        //                             phone: _phoneTextEditController.text,
        //                             notes: _noteTextEditController.text,
        //                             type: widget.screeningType,
        //                             requestFrom: "2"));
        //                   }else if(_nameTextEditController.text.isEmpty){
        //                     showToast("Enter name");
        //
        //                   }else if(_phoneTextEditController.text.isEmpty){
        //                     showToast("Enter phone number");
        //
        //                   }else if(_noteTextEditController.text.isEmpty){
        //                     showToast("Enter any note");
        //                   }
        //                   // cartBloc.addToCart(request: AddToCartRequest(productId: "494",userId: "134",productPrice: "1500.00"));
        //                 },
        //                 child: Text(
        //                   "Submit",
        //                   style: Theme.of(context)
        //                       .textTheme
        //                       .headline6!
        //                       .copyWith(color: Colors.white),
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // )
      ],
    ),);
  }

  Widget screeningBody() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/TOP_BAR.png',
                    width: double.infinity,
                    height: 130,
                    fit: BoxFit.fill,
                  ).image,
                ),
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),

              ),
              height: 130,
              width: _screenSize.width,
              child:Padding(
                padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 20),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: (){
                        Navigator.pop(context);
                      }, icon: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Icon(Icons.arrow_back,color: Colors.white,),
                      )),
                      Text(
                        "Screening",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      IconButton(onPressed: (){
                        // screeningBloc.screeningRequest(request: ScreeningRequest(name: _nameTextEditController.text, phone: _phoneTextEditController.text, notes: _noteTextEditController.text, type: widget.screeningType, requestFrom: "2"));
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
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,),
           child: Text("Enter Personal Details",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
         ),
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black26,blurRadius: 3),],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12))),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name",style: TextStyle(color: AppColors.buttonColor),),
                buildTextField(textEditingController: _nameTextEditController),
                Text("Phone Number",style: TextStyle(color: AppColors.buttonColor),),
                buildTextField(textEditingController: _phoneTextEditController),
                buildRadioTile(screening: Screening.breastCancer,title: "Breast Cancer"),
                Divider(),
                buildRadioTile(screening: Screening.cervicalCancer,title: "Cervical Cancer"),
                Text("Notes",style: TextStyle(color: AppColors.buttonColor),),
                buildTextFieldNotes(textEditingController: _noteTextEditController),






              ],) ,),
            // Expanded(child: Container(color: Colors.amber,))
        ],),
      ),
    );

  }

  Widget buildTextFieldNotes(
      {required TextEditingController textEditingController,}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFFECECEC),
              width: 1,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: TextField(
            controller: textEditingController,
            minLines: 6,
            maxLines: 7,
            decoration: InputDecoration(
                border: InputBorder.none,),
          ),
        ),
      ),
    );
  }

  Widget buildTextField({required TextEditingController textEditingController}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 46,
        decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFFECECEC),
              width: 1,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: TextFormField(
            keyboardType: TextInputType.text,
            controller: textEditingController,
            // onSubmitted: (value) {},
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(5),
              border: InputBorder.none,
              // label: Text(
              //   "Package name",
              //   style: Theme.of(context).textTheme.caption,
              // ),

            ),
          ),
        ),
      ),
    );
  }

  Widget buildRadioTile({required Screening screening,required String title,}) {
    return ListTile(trailing:Radio<Screening>(value: screening,groupValue: selected, onChanged: (val){
      setState(() {
        selected = screening;
        if(screening == Screening.breastCancer){
          selectedType = breastCancerType;
        }
        else if(screening == Screening.breastCancer){
          selectedType =cervicalCancerType;
        }
      });
    },),title: Text(title,style: TextStyle(fontWeight: FontWeight.w600),));
  }
}
