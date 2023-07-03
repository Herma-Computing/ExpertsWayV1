import 'package:flutter/material.dart';

import '../quiz_result_screen/pre_quiz.dart';
import 'components/body.dart';

class QuizScreen extends StatelessWidget {

// ApiProvider().retrieveQuiz() ,
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      body: TermsAndConditions(),
    );
  }
}
