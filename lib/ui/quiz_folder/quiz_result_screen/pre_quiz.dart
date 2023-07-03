import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../models/explore_quiz_model.dart';
import '../../../../services/api_controller.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../services/controllers/question_controller.dart';
import 'package:get/get.dart';

import '../quiz/components/body.dart';

QuestionController _qnController = Get.put(QuestionController());
QuestionController allquestionController = Get.put(QuestionController());

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {

    const gradientColor = [
      Color(0xFF2686FF),
      Color(0xff2686FF),
      Color(0xff26B0FF)
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          onPressed: () => {},
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "fetch Quiz",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
         const Center(child: Padding(
           padding: EdgeInsets.all(8.0),
           child: Text("wait until quiz feching"),
         )),
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
                } else if (snapshot.connectionState == ConnectionState.done) {
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
                        Get.to(() => Body(
                            listOfQuizModel: snapshot.data!.listOfQuizModel,
                          ));
                    });
                   
                    return const Text("");

                 
                  } else {
                    return const Text('Empty data');
                  }
                } else {
                  return Text('State: ${snapshot.connectionState}');
                }
              },
            ),
        ],
      )
    );
  }
}
