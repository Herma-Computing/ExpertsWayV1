// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizModle _$QuizModleFromJson(Map<String, dynamic> json) => QuizModle(
      id: json['id'] as int,
      question: json['question'] as String,
      answerDescription: json['answer_description'] as String,
      randomizeOptions: json['randomize_options'] as String,
      correctAnswer: (json['correct_answer'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      answerOptions: (json['answer_options'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$QuizModleToJson(QuizModle instance) => <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answer_description': instance.answerDescription,
      'randomize_options': instance.randomizeOptions,
      'answer_options': instance.answerOptions,
      'correct_answer': instance.correctAnswer,
    };
