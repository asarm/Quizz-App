import 'package:flutter/cupertino.dart';
import 'Question.dart';

class Question_pool{
  int q_index = 0;
  List<Question> _questionPool = [
      Question("The capital of Italy is Istanbul.",false),
      Question("C programming language was developed by Ken Thompson and Dennis Ritchie.",true),
      Question("The currency of Germany is Yen.",false),
      Question("HTML is a programming language.",false),
      Question("Java programming language belongs to Microsoft.",false),
    ];


  String getQuestionText(){
    return _questionPool[q_index].questionText;
  }

  bool getAnswer(){
    return _questionPool[q_index].questionAnswer;
  }

  void next_question(){
    if(q_index < _questionPool.length-1){
        q_index++;
      }
    print(q_index);
    }

    bool finishQuiz(){
        if(q_index >= _questionPool.length-1)
          return true;
        else
          return false;
    }

    void reset(){
        q_index = 0;
    }
}