import 'package:flutter/material.dart';
import 'question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuestionBank {
  int reset = 0;
  int item = 0;
  int limiter = 0;
  int score = 0;
  String scorestring = "";
  List<Icon> scorekeeper = [];
  List<Question> qobj = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was "Moon".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question('No piece of square dry paper can be folded in half more than 7 times.', false),
    Question('In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.', true),
    Question('The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.', false),
    Question('The total surface area of two human lungs is approximately 70 square metres.', true),
    Question('Google was originally called "Backrub".', true),
    Question('Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.', true),
    Question('In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.', true),
  ];

  String getQuestion() {
    return qobj[item].tanong;
  }

  bool getAnswer() {
    return qobj[item].sagot;
  }

  void nextItem() {
    if (item < 12) {
      item++;
    }
  }

  void checkAnswer(bool A, Function updateState) {
    scorestring = score.toString();
    if (limiter < 13) {
      updateState();
      if (getAnswer() == A) {
        scorekeeper.add(
          Icon(
            Icons.check,
            color: Colors.green
          ),
        );
        score++;
      } else {
        scorekeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),

        );
      }
      nextItem();
      limiter++;
    } else if (limiter==13){
      reset = 1;
      limiter++;
    } else {
      limiter = 0;
      scorekeeper = [];
      item = 0;
      updateState();
      reset = 0;
    }
  }
}
