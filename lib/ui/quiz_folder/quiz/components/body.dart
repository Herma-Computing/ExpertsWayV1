import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../../../../models/quiz_models.dart';
import '../../../../services/api_controller.dart';
import '../../../../services/controllers/question_controller.dart';
import 'progress_bar.dart';
import 'question_card.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _isHours = true;
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
  );
  @override
  void initState() {
    _stopWatchTimer.onStartTimer();
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller
    QuestionController allquestionController = Get.put(QuestionController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                ProgressBar(),
                CircleAvatar(
                  radius: 55,
                  backgroundColor: HexColor('#26B0FF'),
                  child: CircleAvatar(
                    backgroundColor: HexColor("#FFFFFF"),
                    radius: 51,
                    child: StreamBuilder<int>(
                      stream: _stopWatchTimer.rawTime,
                      initialData: _stopWatchTimer.rawTime.value,
                      builder: (context, snap) {
                        final value = snap.data!;
                        final displayTime = StopWatchTimer.getDisplayTime(
                          value,
                          hours: _isHours,
                          milliSecond: false,
                        );
                        return Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: Center(
                                child: Text(
                                  displayTime,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: HexColor('#26B0FF'),
                                      fontFamily: 'Helvetica',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                FutureBuilder<List<QuizModle>>(
                  future: ApiProvider().retrieveQuiz(),
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<List<QuizModle>> snapshot,
                  ) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.black26,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              HexColor('#26B0FF').withOpacity(1), //<-- SEE HERE
                            ),
                          ),
                        ),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      if (snapshot.hasError) {
                    
                        return Text('${snapshot.error}');
                      } else if (snapshot.hasData) {
                        return Expanded(
                          child: PageView.builder(
                              // Block swipe to next qn
                              physics: const NeverScrollableScrollPhysics(),
                              controller: allquestionController.pageController,
                              onPageChanged:
                                  allquestionController.updateTheQnNum,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) => QuestionCard(
                                    question: snapshot.data![index],
                                    listofQuizModle: snapshot.data!,
                                  )
                                  
                                  ),
                        );
                      } else {
                        return const Text('Empty data');
                      }
                    } else {
                      return Text('State: ${snapshot.connectionState}');
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// Expanded(
//                           child: PageView.builder(
//                             // Block swipe to next qn
//                             physics: const NeverScrollableScrollPhysics(),
//                             controller: allquestionController.pageController,
//                             onPageChanged: allquestionController.updateTheQnNum,
//                             itemCount: allquestionController.questions.length,
//                             itemBuilder: (context, index) => QuestionCard(
//                                 question:
//                                     allquestionController.questions[index]),
//                           ),
//                         );
