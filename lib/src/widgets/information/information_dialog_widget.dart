import 'package:ble_app/src/global/global_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<void> informationDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(10),
      child: Stack(
        clipBehavior: Clip.none, //! is mean overflow: Overflow.visible : show
        alignment: Alignment.center,
        children: [
          
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GlobalText(text: 'UUID List', fontSize: 25, fontWeight: FontWeight.bold,),
                  ],
                ),
                // GlobalText(text: 'text'),
                // GlobalText(text: 'text'),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                      
                                      GlobalText(text: 'text', fontSize: 33,),
                                      GlobalText(text: 'text', fontSize: 33,),
                                      GlobalText(text: 'text', fontSize: 33,),
                                      GlobalText(text: 'text', fontSize: 33,),
                                      GlobalText(text: 'text', fontSize: 33,),
                                      GlobalText(text: 'text', fontSize: 33,),
                            ],
                          ),
                        ),
                      )
                
                    ],
                  ),
                )
              ],
              
            ),
            
          ),
         Positioned(
            top: -95,
            child: SvgPicture.asset(
              "assets/images/icons/screen1.svg",
              // width: 130,
              width: MediaQuery.of(context).size.width * 0.18,
              height: MediaQuery.of(context).size.height * 0.18,
              // height: 130,
            ),
          ) , 
        ],
      ),
    ),
  );
}
