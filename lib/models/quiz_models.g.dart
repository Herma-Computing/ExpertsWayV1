// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizModle _$QuizModleFromJson(Map<String, dynamic> json) => QuizModle(
      id: json['id'] as int,
      question: json['question'] as String,
      answer_description: json['answer_description'] as String,
      randomize_options: json['randomize_options'] as String,
      correct_answer: (json['correct_answer'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      answer_options: (json['answer_options'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$QuizModleToJson(QuizModle instance) => <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answer_description': instance.answer_description,
      'randomize_options': instance.randomize_options,
      'answer_options': instance.answer_options,
      'correct_answer': instance.correct_answer,
    };

QuizModeltosend _$QuizModeltosendFromJson(Map<String, dynamic> json) =>
    QuizModeltosend(
      out_of: json['out_of'] as int,
      score: json['score'] as int,
    );

Map<String, dynamic> _$QuizModeltosendToJson(QuizModeltosend instance) =>
    <String, dynamic>{
      'out_of': instance.out_of,
      'score': instance.score,
    };
