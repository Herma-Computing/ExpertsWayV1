import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../services/controllers/question_controller.dart';
import '../../../constants.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        width: double.infinity,
        height: 20,
        decoration: BoxDecoration(
          border:
              Border.all(color: Color.fromARGB(255, 59, 58, 58), width: 0.2),
          borderRadius: BorderRadius.circular(50),
        ),
        child: GetBuilder<QuestionController>(
          init: QuestionController(),
          builder: (controller) {
            return Stack(
              children: [
                // LayoutBuilder provide us the available space for the conatiner
                // constraints.maxWidth needed for our animation
                LayoutBuilder(
                  builder: (context, constraints) => Container(
                    // from 0 to 1 it takes 60s
                    width: constraints.maxWidth * controller.animation.value,
                    decoration: BoxDecoration(
                      color: HexColor('#26B0FF').withOpacity(1),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                    child: Text(
                        "${(controller.animation.value * 60).round()} sec"),
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
