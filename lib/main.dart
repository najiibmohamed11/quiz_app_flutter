import 'package:flutter/material.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/screentwo.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int questionindex = 0;
  List<Questions> questionlist = [
    Questions(questinname: 'MY NAME IS ABDINAJIB', questionanswer: true),
    Questions(questinname: 'MY FATHER NAME IS MOHAMED', questionanswer: false),
    Questions(questinname: 'MY GRAND MOM IS HAWA', questionanswer: true)
  ];

  var wrongquestions = 0;
  var rightquestion = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 200.0),
                child: Text(
                  questionlist[questionindex].questionName!,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 1000,
                    height: 60,
                    margin: EdgeInsets.only(right: 20, left: 20, bottom: 30.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      onPressed: () {
                        try {
                          final iscorrect =
                              questionlist[questionindex].qustionAsnwer!;
                          setState(() {
                            if (questionindex < questionlist.length - 1) {
                              questionindex++;
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Screentwo(
                                    rightquestion: rightquestion,
                                    wrongquestions: wrongquestions,
                                  ),
                                ),
                              );
                            }
                          });
                          if (iscorrect) {
                            rightquestion++;
                            print('sax');
                          } else {
                            wrongquestions++;
                            print('qalaad');
                          }
                        } catch (e, stackTrace) {
                          print('Error: $e');
                          print('Stack trace: $stackTrace');
                        }
                      },
                      child: Text(
                        "true",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  Container(
                    width: 1000,
                    height: 60,
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      onPressed: () {
                        bool isfalse =
                            questionlist[questionindex].qustionAsnwer!;
                        setState(() {
                          if (questionindex < questionlist.length - 1) {
                            questionindex++;
                          } else {
                            questionindex = 0;
                            print("ended the quiz");
                          }
                          if (isfalse) {
                            wrongquestions++;
                            print("qalad");
                          } else {
                            rightquestion++;
                            print("sax");
                          }
                        });
                      },
                      child: Text(
                        "false",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
