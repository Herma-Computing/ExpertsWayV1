import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../models/Questions.dart';
import '../../../../services/controllers/question_controller.dart';
import '../../../../services/controllers/quiz_progress_bar_controller.dart';
import '../../../constants.dart';
import '../../../pages/navmenu/menu_dashboard_layout.dart';

import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    // it means we have to pass this
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) { //
    QuestionController controller = Get.put(QuestionController());
        QuizProgressController QuizProgressControllers = Get.put(QuizProgressController());
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: kBlackColor),
          ),
          ...List.generate(
            question.options.length,
            (index) => Option(
              index: index,
              text: question.options[index],
              press: () => controller.checkAns(question, index),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0)),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MenuDashboardLayout()));
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      color: HexColor('#26B0FF').withOpacity(1),
                    ),
                  )),
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0)),
                  color: HexColor('#26B0FF').withOpacity(1),
                  onPressed: (){
                      controller.nextQuestion;
                      QuizProgressControllers.quizProgressBarController;
                    
                  },
                
                  child: const Text("Next")),
            ],
          )
        ],
      ),
    );
  }
}
