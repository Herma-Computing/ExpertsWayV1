import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../services/controllers/question_controller.dart';
import '../../../../services/controllers/quiz_progress_bar_controller.dart';

class ProgressBar extends StatefulWidget {
  ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    final QuizProgressController progresBarController =
        Get.put(QuizProgressController());
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        width: double.infinity - 600,
        height: 11,
        decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromARGB(255, 59, 58, 58), width: 0.2),
          borderRadius: BorderRadius.circular(50),
        ),
        child: GetBuilder<QuestionController>(
          init: QuestionController(),
          builder: (controller) {
            return Stack(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) => Container(
                    width: progresBarController.count.value,
                    decoration: BoxDecoration(
                      color: HexColor('#26B0FF').withOpacity(1),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
