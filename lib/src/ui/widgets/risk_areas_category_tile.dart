import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../flutter_flow/flutter_flow_theme.dart';

class CategoryTileWidget extends StatefulWidget {
  final String? riskAreaTitle;
  final String? riskAreaImageWidget;
  const CategoryTileWidget({
    Key? key,
    required this.riskAreaTitle,
    required this.riskAreaImageWidget,
  }) : super(key: key);

  @override
  State<CategoryTileWidget> createState() => _CategoryTileWidgetState();
}

class _CategoryTileWidgetState extends State<CategoryTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      // clipBehavior: Clip.hardEdge,
      children: [
        Container(
          height: 104,
          width: 116,
          decoration: BoxDecoration(
            // image: widget.riskAreaImageWidget,
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[350]!,
                offset: const Offset(1.0, 1.0),
                blurRadius: 5.0,
                spreadRadius: 1.0,
              ),
              const BoxShadow(
                color: Colors.white,
                offset: Offset(-1.0, -1.0),
                blurRadius: 5.0,
                spreadRadius: 1.0,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // SizedBox(height: 3),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    scale: 2.5,
                    image: NetworkImage(
                      widget.riskAreaImageWidget.toString(),
                      scale: 2.5,
                    ),
                  ),
                ),
              ),
              // SizedBox(height: 5),
              Text(
                widget.riskAreaTitle!,
                // style: kPickFavTextStyle,
                softWrap: true,
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).subtitle1.override(
                      fontFamily: 'Titillium Web',
                      fontSize: 10,
                      color: Colors.black,
                    ),
              ),
              // SizedBox(height: 3),
            ],
          ),

          // widget.isFavChecked == true ?  Positioned(
          //   bottom: 0,
          //   right: 0,
          //   left: 49,
          //   top: 49,
          //   child:
          //   Container(
          //     // alignment: Alignment.bottomRight,
          //     margin: EdgeInsets.zero,
          //     padding: EdgeInsets.zero,
          //     height: 10,
          //     width: 10,
          //     // child: Image.asset('assets/images/TICK.png',height: 30,width: 30,fit: BoxFit.cover,),
          //     decoration: const BoxDecoration(
          //       // color: Colors.white,
          //       shape: BoxShape.circle,
          //
          //       image: DecorationImage(
          //
          //         image: AssetImage(
          //             'assets/images/checked.png'),
          //         fit: BoxFit.fill,
          //
          //
          //       ),
          //       // color: mainRedShadeForText,
          //       boxShadow: [
          //         BoxShadow(
          //             blurRadius: 1.5,
          //             color: Colors.black26,
          //             offset: Offset(0, 1))
          //       ],
          //     ),
          //   ),
          // )
          //
          // : Container(),
        ),
      ],
    );
    // const SizedBox(height: 10),
  }
}
