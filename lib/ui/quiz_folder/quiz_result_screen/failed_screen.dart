import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../models/quiz_models.dart';
import '../../../services/controllers/question_controller.dart';

class FailedScreen extends StatelessWidget {
   final List<QuizModle>quizmodels;
  const  FailedScreen({required this.quizmodels , Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController qnController = Get.put(QuestionController());
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 35, left: 35, top: 35),
                child: SvgPicture.asset(
                  'assets/images/personal_goal.svg',
                ),
              ),
              CircleAvatar(
                backgroundColor: HexColor('#26B0FF').withOpacity(1),
                radius: 40,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "${((qnController.numOfCorrectAns * 100) / quizmodels.length).roundToDouble()}%",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  "You've Failed",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                children: [
                  Text('You’re one step closer to etting to',
                      style: TextStyle(
                          fontSize: 16,
                          color: HexColor('#2E2E2E').withOpacity(0.5),
                          fontWeight: FontWeight.normal)),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Text(' your goals  Keep this up and you’ll ',
                        style: TextStyle(
                            fontSize: 16,
                            color: HexColor('#2E2E2E').withOpacity(0.5),
                            fontWeight: FontWeight.normal)),
                  ),
                  Text('be there  We Believe In You!  ',
                      style: TextStyle(
                          fontSize: 16,
                          color: HexColor('#2E2E2E').withOpacity(0.5),
                          fontWeight: FontWeight.normal))
                ],
              ),
              Container(
                margin: const EdgeInsets.all(42),
                width: 208.47,
                height: 44,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [
                        HexColor('#26B0FF').withOpacity(1),
                        HexColor('#26B0FF'),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15)),
                child: const Center(
                  child: Text(
                    'Continue',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
