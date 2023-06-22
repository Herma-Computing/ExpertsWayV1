
part 'quiz_models.g.dart';
class QuizModle {
  int id;
  String question;
  
  String answer_description;

  String randomize_options;
 
  List<String> answer_options;
 
  List<int> correct_answer;

  QuizModle(
      {required this.id,
      required this.question,
      required this.answer_description,
      required this.randomize_options,
      required this.correct_answer,
      required this.answer_options,
      // required this.quiz,
      });
  factory  QuizModle.fromJson( Map<String, dynamic>json) {
  return  _$QuizModleFromJson(json);
  }
      
  Map<String, dynamic> toJson() => _$QuizModleToJson(this);

  
}

class QuizModeltosend {
  final int out_of;
  final int score;

  const QuizModeltosend({required this.out_of, required this.score});

  factory QuizModeltosend.fromJson(Map<String, dynamic> json) =>
      _$QuizModeltosendFromJson(json);
  Map<String, dynamic> toJson() => _$QuizModeltosendToJson(this);
}
