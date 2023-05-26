import 'package:flutter/material.dart';

import 'components/body.dart';

class QuizScreen extends StatelessWidget {

// ApiProvider().retrieveQuiz() ,
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      body: Body(),
    );
  }
}
