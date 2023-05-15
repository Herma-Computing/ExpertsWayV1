


import 'package:get/get.dart';

class QuizProgressController extends GetxController{




   double    _quizPregressBarLength=3.0;
  double  get quizProgressBarController=>_quizPregressBarLength;
  quzizProgresBarIncrement(){
    _quizPregressBarLength++;
    update();
  }

}