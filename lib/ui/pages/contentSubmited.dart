import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class myonbording extends StatelessWidget {
  const myonbording({super.key});

  @override
  Widget build(BuildContext context) {
    const backgroundColor= Color(0xff3B4C54);
    const gradentColor=[
      Color(0xFF2686FF),
      Color(0xff2686FF),
      Color(0xff26B0FF)

    ];
    return  Scaffold(
      backgroundColor:backgroundColor ,
    body: Center(
      child: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/freelancer.svg'),
            SizedBox(height: 40,),
            Text("Content Submitted Successfully",textAlign: TextAlign.center,style:TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.w600,),),
            SizedBox(height: 20,),
            Text("Our developers will receive your content to examine. An email will be delivered to you shortly. Thank you",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w400),)
            ,
            SizedBox(height: 98,),
            Container(
              width: 282,
              height: 53,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(colors: gradentColor,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight
              ),
              ),
              child: Center(child: Text("Continue",style: TextStyle(fontSize: 18 ,fontWeight: FontWeight.w400,color: Colors.white,),)),)
          ],
        ),
      ),
    ),
    );
  }
}