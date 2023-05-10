import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:learncoding/ui/constants.dart';

import '../../../services/controllers/question_controller.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 35, left: 35, top: 35),
                child: SvgPicture.asset(
                  'assets/images/second.svg',
                ),
              ),
              CircleAvatar(
                backgroundColor: HexColor('#26B0FF').withOpacity(1),
                radius: 45,
                child: Text(
                  "${_qnController.correctAns * 1}/${_qnController.questions.length * 1}",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: kSecondaryColor),
                ),
              ),
              Text('Good Job'),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: const Text(
                    'Good Job, You’re making progress but we believe that +'
                    ' you can do even more. Don’t Give Up!!'),
              ),
              Container(
                margin: const EdgeInsets.all(60),
                width: 208.47,
                height: 44,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [
                        Color(0xff15BE77),
                        Color(0xff53E88B),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10)),
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
