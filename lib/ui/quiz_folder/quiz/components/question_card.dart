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
  Widget build(BuildContext context) {
    //
    QuestionController controller = Get.put(QuestionController());
    QuizProgressController QuizProgressControllers =
        Get.put(QuizProgressController());
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              question.question,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: kBlackColor),
            ),
            const SizedBox(
              height: 25,
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
              height: 25,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.width * 0.1,
                    child: ElevatedButton(
                      onPressed: () {
                       Get.to(MenuDashboardLayout());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        side:
                            BorderSide(width: 2.0, color: HexColor('#26B0FF')),
                        elevation: 1.0,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'Skip',
                          style: TextStyle(
                              fontSize: 15, color: HexColor('#26B0FF')),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.width * 0.1,
                    child: ElevatedButton(
                    onPressed: controller.nextQuestion,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: HexColor('#26B0FF'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        side:
                            BorderSide(width: 2.0, color: HexColor('#26B0FF')),
                        elevation: 5.0,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'Next',
                          style: TextStyle(
                              fontSize: 15, color: HexColor('#FFFFFF')),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
