import 'package:flutter/material.dart';

import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    QuestionController _controller = Get.put(QuestionController());
=======
    // QuestionController _controller = Get.put(QuestionController());
>>>>>>> 919998cb4d08c2a3865c8eef6837e0315187293b
    return const Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   // Fluttter show the back button automatically
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   actions: [
    
      //   ],
      // ),
      body: Body(),
    );
  }
}
