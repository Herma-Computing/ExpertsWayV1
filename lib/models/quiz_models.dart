import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:learncoding/services/controllers/question_controller.dart';

import '../services/controllers/quiz_progress_bar_controller.dart';
part 'quiz_models.g.dart';

@JsonSerializable()
class QuizModle {
  int id;
  String question;
  @JsonKey(name: 'answer_description')
  String answerDescription;
  @JsonKey(name: 'randomize_options')
  String randomizeOptions;
  @JsonKey(name: 'answer_options')
  List<String> answerOptions;
  @JsonKey(name: 'correct_answer')
  List<int> correctAnswer;
  // List<dynamic>quiz;
  QuizModle(
      {required this.id,
      required this.question,
      required this.answerDescription,
      required this.randomizeOptions,
      required this.correctAnswer,
      required this.answerOptions,
      // required this.quiz,
      });
  factory  QuizModle.fromJson( Map<String, dynamic>json) {
  return  _$QuizModleFromJson(json);
  }
      
  Map<String, dynamic> toJson() => _$QuizModleToJson(this);

  
}
