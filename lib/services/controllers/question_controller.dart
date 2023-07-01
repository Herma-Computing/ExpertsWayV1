import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:learncoding/services/controllers/quiz_progress_bar_controller.dart';

import '../../models/quiz_models.dart';
import '../../ui/quiz_folder/quiz_result_screen/amazing_screen.dart';
import '../../ui/quiz_folder/quiz_result_screen/failed_screen.dart';
import '../../ui/quiz_folder/quiz_result_screen/good_job_screen.dart';
import '../api_controller.dart';

QuizProgressController progressController = Get.put(QuizProgressController());
ApiProvider apiprovider = ApiProvider();
// We use get package for our state management

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  List<QuizModle> quizmodelList = [];
  int quizLife = 0;
  bool isZero = false;
  int nextAutoFill = 0;
  late int remainingTime = 0; //initial time in seconds
  late Timer _timer;
  List<QuizModle> get totalQuiz => quizmodelList;
  int get quizLifes => quizLife;
  int get autofill => nextAutoFill;
  bool get isQuizLifeZero => isZero;
  int get theremainingTime => remainingTime;

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

  getTotalQuetionNumber(
      List<QuizModle> totalquizlList, int life, int auizAutofill) {
    quizmodelList = totalquizlList;
    quizLife = life;
    nextAutoFill = auizAutofill;

    update();
  }

  void checkAns(QuizModle question, int selectedIndex) {
    // because once user press any option then it will run
    _isAnswered = true;
    _correctAns = question.correct_answer[0];
    _selectedAns = selectedIndex;

    update();
  }

  nextQuestion(List<QuizModle> question) {
    if (isAnswered == false) {
      return Get.snackbar("you must select one answer",
          "procedding without answer the quetion is not allowed");
    } else {
      if (correctAns == selectedAns) {
        _numOfCorrectAns++;
        update();
      } else {
        if (quizLife > 0) {
          quizLife--;
        }
        if (quizLife == 0) {
          isZero = true;
          _startTimer();
        }

        update();
      }

      if (_questionNumber.value != question.length &&
          correctAns == selectedAns) {
        _isAnswered = false;
        progressController.increment();
        _pageController.nextPage(
            duration: const Duration(milliseconds: 250), curve: Curves.ease);
      } else if (_questionNumber.value == question.length &&
          correctAns == selectedAns) {
        if ((((numOfCorrectAns * 100) / totalQuiz.length).roundToDouble()) >=
            70) {
          apiprovider.submitResult(
              modelsTosendtoServer: QuizModeltosend(
                  out_of: totalQuiz.length, score: numOfCorrectAns));
          Get.to(() => AmezingScreen(quizmodels: totalQuiz));
        } else if ((((numOfCorrectAns * 100) / totalQuiz.length)
                .roundToDouble()) >=
            50) {
          apiprovider.submitResult(
              modelsTosendtoServer: QuizModeltosend(
                  out_of: totalQuiz.length, score: numOfCorrectAns));
          Get.to(() => GoodJobScreen(quizmodels: totalQuiz));
        } else if ((((numOfCorrectAns * 100) / totalQuiz.length)
                .roundToDouble()) <=
            50) {
          apiprovider.submitResult(
              modelsTosendtoServer: QuizModeltosend(
                  out_of: totalQuiz.length, score: numOfCorrectAns));
          Get.to(() => FailedScreen(quizmodels: totalQuiz));
        }
      }
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  //Timer  that counts down the auto_fill_quiz_value
  void _startTimer() {
    remainingTime = (autofill * 6); //initial time in seconds
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (autofill > 0) {
        
        remainingTime--;
        if (remainingTime == 0 && quizLife == 0) {
          isZero = false;
          quizLife = autofill;

          update();
        }

        update();
      } else {
        _timer.cancel();
        update();
      }
      
    });
  }
}
