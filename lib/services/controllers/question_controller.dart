import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:learncoding/services/controllers/quiz_progress_bar_controller.dart';

import '../../models/quiz_models.dart';
import '../../ui/quiz_folder/quiz_result_screen/amazing_screen.dart';
import '../../ui/quiz_folder/quiz_result_screen/failed_screen.dart';
import '../../ui/quiz_folder/quiz_result_screen/good_job_screen.dart';

QuizProgressController progressController = Get.put(QuizProgressController());

// We use get package for our state management

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  List<QuizModle> quizmodelList = [];
  List<QuizModle> get totalQuiz => quizmodelList;

  late PageController _pageController;
  PageController get pageController => _pageController;

  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  int _correctAns = 0;
  int get correctAns => _correctAns;

  int? _selectedAns;
  int? get selectedAns => _selectedAns;

  // for more about obs please check documentation
  final RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => _numOfCorrectAns;

  // called immediately after the widget is allocated memory
  @override
  void onInit() {
    _pageController = PageController();
    super.onInit();
  }

  // // called just before the Controller is deleted from memory
  @override
  void onClose() {
    super.onClose();

    _pageController.dispose();
  }

  getTotalQuetionNumber(List<QuizModle> totalquizlList) {
    quizmodelList = totalquizlList;
    update();
  }

  void checkAns(QuizModle question, int selectedIndex) {
    // because once user press any option then it will run
    _isAnswered = true;
    _correctAns = question.correctAnswer[0];
    _selectedAns = selectedIndex;

    update();
  }

  nextQuestion(List<QuizModle> question) {
    if (correctAns == selectedAns) _numOfCorrectAns++;
    update();
    if (_questionNumber.value != question.length) {
      if (isAnswered == false) {
        return Get.snackbar("you must select one answer",
            "procedding without answer the quetion is not allowed");
      } else {
        _isAnswered = false;
        progressController.increment();
        _pageController.nextPage(
            duration: const Duration(milliseconds: 250), curve: Curves.ease);
      }
    } else {
      if ((numOfCorrectAns * 1) >= 3) {
        Get.to(() => AmezingScreen(quizmodels: totalQuiz));
      } else if ((numOfCorrectAns * 1) == 2) {
        Get.to(() => GoodJobScreen(quizmodels: totalQuiz));
      } else if ((numOfCorrectAns * 1) < 2) {
        Get.to(() => FailedScreen(quizmodels: totalQuiz));
      }
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
