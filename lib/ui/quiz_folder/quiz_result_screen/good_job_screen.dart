import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../services/controllers/question_controller.dart';

class GoodJobScreen extends StatelessWidget {
  const GoodJobScreen({Key? key}) : super(key: key);

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
                    "${(qnController.correctAns * 1) * 100 / 4}%",
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
                  'Good Job',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28, top: 8, right: 18),
                child: Text(
                    'Good Job, You’re making progress but we believe that you can do  ',
                    style: TextStyle(
                        fontSize: 16,
                        color: HexColor('#2E2E2E').withOpacity(0.5),
                        fontWeight: FontWeight.normal)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28, top: 1, right: 18),
                child: Text('even more. Don’t Give Up!!',
                    style: TextStyle(
                        fontSize: 16,
                        color: HexColor('#2E2E2E').withOpacity(0.5),
                        fontWeight: FontWeight.normal)),
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
