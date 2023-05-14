


import 'package:get/get.dart';

class QuizProgressController extends GetxController{




   final RxInt  _quizPregressBarLength=2.obs;
  RxInt get quizProgressBarController=>_quizPregressBarLength;
  quzizProgresBarIncrement()=>_quizPregressBarLength.value++;

}