import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:learncoding/services/ad_manager.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../../../../models/explore_quiz_model.dart';
import '../../../../services/api_controller.dart';
import '../../../../services/controllers/question_controller.dart';
import 'progress_bar.dart';
import 'question_card.dart';

QuestionController _qnController = Get.put(QuestionController());
QuestionController _controller = Get.find<QuestionController>();
AdManager adsmanager = AdManager();

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _isHours = true;
  bool isfetched = false;
  
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
  );
  late final StopWatchTimer timers = StopWatchTimer(
      mode: StopWatchMode.countDown,
      presetMillisecond:
          StopWatchTimer.getMilliSecFromMinute(5),
      onEnded: () {
        _qnController.fuelTimer();
      });

  @override
  void initState() {
    _stopWatchTimer.onStartTimer();
    timers.onStartTimer();

    adsmanager.createRewardedAd();
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    adsmanager.rewardedAd?.dispose();
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
          SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const SizedBox(
                      height: 76,
                    ),
                    Expanded(child: ProgressBar()),
                    const Icon(
                      Icons.heart_broken,
                      color: Colors.red,
                      size: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 30,
                      ),
                      child: GetBuilder<QuestionController>(
                          init: _controller,
                          builder: (_) {
                            return Text(
                              '${_controller.quizLifes}',
                              style: const TextStyle(fontSize: 25),
                            );
                          }),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 55,
                  backgroundColor: HexColor('#26B0FF'),
                  child: CircleAvatar(
                    backgroundColor: HexColor("#FFFFFF"),
                    radius: 51,
                    child: StreamBuilder<int>(
                      stream: _stopWatchTimer.rawTime,
                      initialData: 5,
                      builder: (context, snap) {
                        final value = snap.data!;
                        final displayTime = StopWatchTimer.getDisplayTime(
                          value,
                          hours: _isHours,
                          milliSecond: false,
                          second: true,
                          minute: true,
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
                FutureBuilder<ExploreData>(
                  future: ApiProvider().retrieveQuiz(),
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<ExploreData> snapshot,
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
                        // if there is no internet connection the code excutes here,
                        // you must handle internet connection
                        print(snapshot.error);
                        return Padding(
                          padding: EdgeInsets.all(38.0),
                          child: Text(
                            "${snapshot.error}....or  you don't have internet conneection or low internet connection problem",
                            style: TextStyle(fontSize: 15),
                          ),
                        );
                      } else if (snapshot.hasData) {
                      
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          _qnController.getTotalQuetionNumber(
                            snapshot.data!.listOfQuizModel,
                            snapshot.data!.quizLife,
                            snapshot.data!.quizLifeAutoFill,
                          );
                        });
                        return Expanded(
                          child: PageView.builder(
                              // Block swipe to next qn
                              physics: const NeverScrollableScrollPhysics(),
                              controller: allquestionController.pageController,
                              onPageChanged:
                                  allquestionController.updateTheQnNum,
                              itemCount: snapshot.data!.listOfQuizModel.length,
                              itemBuilder: (context, index) => QuestionCard(
                                    question:
                                        snapshot.data!.listOfQuizModel[index],
                                    listofQuizModle:
                                        snapshot.data!.listOfQuizModel,
                                  )),
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
          ),
          GetBuilder<QuestionController>(
              init: _controller,
              builder: (_) {
                return _controller.isQuizLifeZero == true
                    ? Positioned(
                        bottom: 250,
                        child: CupertinoAlertDialog(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.warning,
                                  color: Colors.red,
                                ),
                              ),
                              Text(
                                'Your life is Over !',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),

                          // ${_controller.theremainingTime}

                          content: StreamBuilder<int>(
                            stream: timers.rawTime,
                            initialData: timers.rawTime.value,
                            builder: (context, snap) {
                              final value = snap.data!;
                              final displayTime = StopWatchTimer.getDisplayTime(
                                value,
                                hours: true,
                                milliSecond: false,
                                minute: true,
                                second: true,
                              );

                              return Text(
                                  'Wait ${displayTime} minutes  or  Click "Watch Ad" button below to refuel it');
                            },
                          ),
                          actions: <Widget>[
                            CupertinoDialogAction(
                                isDefaultAction: true,
                                child: const Text(
                                  'Watch Ad',
                                  style: TextStyle(
                                    fontSize: 15 - .0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 14, 203, 255),
                                  ),
                                ),
                                onPressed: () => {
                                      if (adsmanager.rewardedAd != null)
                                        {adsmanager.showRewardedAd()}
                                    })
                          ],
                        ),
                      )
                    : Container(
                        height: 0,
                        width: 0,
                      );
              })
        ],
      ),
    );
  }
}
