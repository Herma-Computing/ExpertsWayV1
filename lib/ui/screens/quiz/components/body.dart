import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:flutter_svg/svg.dart';

import '../../../../services/controllers/question_controller.dart';
import 'progress_bar.dart';
import 'question_card.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller
    QuestionController _allquestionController = Get.put(QuestionController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                ProgressBar(),
                CircleAvatar(
                  backgroundColor: HexColor('#26B0FF').withOpacity(0.8),
                  radius: 45,
                  child: Text(
                    '1:31',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    // Block swipe to next qn
                    physics: NeverScrollableScrollPhysics(),
                    controller: _allquestionController.pageController,
                    onPageChanged: _allquestionController.updateTheQnNum,
                    itemCount: _allquestionController.questions.length,
                    itemBuilder: (context, index) => QuestionCard(
                        question: _allquestionController.questions[index]),
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
