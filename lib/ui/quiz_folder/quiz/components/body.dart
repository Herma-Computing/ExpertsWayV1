import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:flutter_svg/svg.dart';

import '../../../../services/controllers/question_controller.dart';
import '../../../constants.dart';
import 'progress_bar.dart';
import 'question_card.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

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
                const ProgressBar(),
                CircleAvatar(
                  radius: 45,
                  backgroundColor: HexColor('#26B0FF'),
                  child: CircleAvatar(
                    backgroundColor: HexColor("#FFFFFF"),
                    radius: 42,
                    child: Text(
                      '1:39',
                      style: TextStyle(
                          fontSize: 25,
                          color: HexColor('#26B0FF'),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                //               Text(
                //    "${(_allquestionController.correctAns * 1) * 100 / 4}%",
                //   style: Theme.of(context)
                //       .textTheme
                //       .headline4!
                //       .copyWith(color: kSecondaryColor),
                // ),
                Expanded(
                  child: PageView.builder(
                    // Block swipe to next qn
                    physics:const  NeverScrollableScrollPhysics(),
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
