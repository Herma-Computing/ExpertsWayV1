
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../services/controllers/question_controller.dart';
import 'progress_bar.dart';
import 'question_card.dart';


class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  
  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller
    QuestionController allquestionController = Get.put(QuestionController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                 ProgressBar(),
                CircleAvatar(
                  radius: 45,
                  backgroundColor: HexColor('#26B0FF'),
                  child: CircleAvatar(
                    backgroundColor: HexColor("#FFFFFF"),
                    radius: 42,
                    child:Text("hi"),
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    // Block swipe to next qn
                    physics: const NeverScrollableScrollPhysics(),
                    controller: allquestionController.pageController,
                    onPageChanged: allquestionController.updateTheQnNum,
                    itemCount: allquestionController.questions.length,
                    itemBuilder: (context, index) => QuestionCard(
                        question: allquestionController.questions[index]),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
