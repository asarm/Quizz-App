import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Question.dart';
import 'Question_pool.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(Quiz());
}

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: QuizPage(),
        )),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> resultList = [];
  Question_pool question_pool = Question_pool();
  int correct_ans = 0;

  void finish_quiz() {
    Alert(
        context: context,
        type: AlertType.info,
        title: "Quiz Complated",
        desc: "Your Score: $correct_ans",
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Okay",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.lightGreen,
          )
        ]).show();
    question_pool.reset();
    resultList = [];
    correct_ans = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        //Question Text Area
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                question_pool.getQuestionText(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: Colors.white),
              ),
            ),
          ),
        ),

        //'True' Button Area
        Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(3),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                textColor: Colors.white,
                color: Colors.green,
                onPressed: () {
                  //Right choice
                  setState(() {
                    if(question_pool.finishQuiz()){
                      if (question_pool.getAnswer()) {
                        resultList.add(
                          Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                        );
                        correct_ans++;
                      }
                      else if (!question_pool.getAnswer())
                        resultList.add(
                          Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        );
                      finish_quiz();
                    }
                    else{
                      if (question_pool.getAnswer()) {
                        resultList.add(
                          Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                        );
                        correct_ans++;
                      }
                      else if (!question_pool.getAnswer())
                        resultList.add(
                          Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        );
                      question_pool.next_question();
                    }

                    }
                  );
                },
                child: Text(
                  "True",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white),
                ),
              ),
            )),
        SizedBox(
          height: 10,
        ),

        //'Wrong' Button Area
        Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(3),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                textColor: Colors.white,
                color: Colors.red,
                onPressed: () {
                  //Wrong Choice
                  setState(() {
                    if (question_pool.finishQuiz()) {
                      if (!question_pool.getAnswer()){
                        resultList.add(
                          Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                        );
                        correct_ans++;
                      }
                      else if (question_pool.getAnswer())
                        resultList.add(
                          Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        );
                      finish_quiz();
                    }
                    else{
                      if (!question_pool.getAnswer()){
                        resultList.add(
                          Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                        );
                        correct_ans++;
                      }
                      else if (question_pool.getAnswer())
                        resultList.add(
                          Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        );
                      question_pool.next_question();
                    }
                  });
                },
                child: Text(
                  "False",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white),
                ),
              ),
            )),
        SizedBox(
          height: 25,
        ),
        Row(
          children: resultList,
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
