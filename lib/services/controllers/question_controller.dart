import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:learncoding/services/controllers/quiz_progress_bar_controller.dart';

import '../../models/Questions.dart';

import '../../ui/quiz_folder/quiz_result_screen/amazing_screen.dart';
import '../../ui/quiz_folder/quiz_result_screen/failed_screen.dart';
import '../../ui/quiz_folder/quiz_result_screen/good_job_screen.dart';

QuestionController _qnController = Get.put(QuestionController());
QuizProgressController progressController = Get.put(QuizProgressController());

// We use get package for our state management

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late PageController _pageController;
  PageController get pageController => _pageController;

  final List<Question> _questions = sample_data
      .map(
        (question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index']),
      )
      .toList();
  List<Question> get questions => _questions;

  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  int _correctAns = 0;
  int get correctAns => _correctAns;

  late int _selectedAns;
  int get selectedAns => _selectedAns;

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

  void checkAns(Question question, int selectedIndex) {
    // because once user press any option then it will run
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    update();
  }

  nextQuestion() {
    if (correctAns == selectedAns) _numOfCorrectAns++;
    update();
    if (_questionNumber.value != _questions.length) {
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
      if ((_qnController.numOfCorrectAns * 1) >= 3) {
        Get.to(() => const AmezingScreen());
      } else if ((_qnController.numOfCorrectAns * 1) == 2) {
        Get.to(() => const GoodJobScreen());
      } else if ((_qnController.numOfCorrectAns * 1) < 2) {
        Get.to(() => const FailedScreen());
      }
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
