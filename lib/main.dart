import 'package:flutter/material.dart';
import 'app_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const QuizHome());
}

class QuizHome extends StatelessWidget {
  const QuizHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz'),
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
        ),
        body: const Padding(
          padding: EdgeInsets.all(20),
          child: QuizPage(),
        ),
        backgroundColor: Color.fromARGB(97, 25, 86, 124),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> answerRes = [];
  int rightAns = 0;
  App_brain appbrain = new App_brain();
  void checkAns(bool pick) {
    setState(() {
      if (pick == appbrain.getQuesAns()) {
        rightAns++;
        answerRes.add(
          const Padding(
            padding: EdgeInsets.all(3),
            child: Icon(
              Icons.thumb_up,
              color: Color.fromARGB(255, 136, 232, 140),
            ),
          ),
        );
      } else {
        answerRes.add(
          const Padding(
            padding: EdgeInsets.all(3),
            child: Icon(
              Icons.thumb_down,
              color: Color.fromARGB(255, 152, 40, 32),
            ),
          ),
        );
      }
      if (appbrain.isFinished() == true) {
        Alert(
          context: context,
          title: "Quiz FInished!",
          desc: "You have answered $rightAns correct answers. ",
          buttons: [
            DialogButton(
              child: Text(
                "Restart",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        appbrain.reset();
        answerRes = [];
        rightAns = 0;
      } else {
        appbrain.nextQues();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: answerRes,
        ),
        Expanded(
          child: Column(
            children: [
              Image.asset(appbrain.getQuesImg()),
              const SizedBox(
                height: 15,
              ),
              Text(
                appbrain.getQuesText(),
                style: const TextStyle(fontSize: 25, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                checkAns(true);
              },
              child: const Text('صح'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 36, 107, 165)),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                checkAns(false);
              },
              child: const Text('خطأ'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
            ),
          ],
        )
      ],
    );
  }
}
