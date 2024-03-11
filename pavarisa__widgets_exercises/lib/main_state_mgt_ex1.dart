import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (context) => CountScore(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/home': (context) => const QuizHomePage(),
          '/quiz_ex': (context) => const QuestionWithChoice(
                title: "What is this animal called?",
                imagePath:
                    "https://www.dnr.sc.gov/marine/pub/seascience/images/horseshoecrab1.jpg",
                currentIndex: 1,
              ),
          '/restart': (context) => const RestartQuiz(),
        },
        title: "",
        home: Scaffold(
          appBar: screenW <= 600
              ? AppBar(
                  backgroundColor: Colors.white,
                  title: const Text(
                    "",
                    style: TextStyle(color: Colors.black),
                  ),
                )
              : null,
          body: const QuizHomePage(),
        ),
      ),
    );
  }
}

class QuizHomePage extends StatelessWidget {
  const QuizHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(
          height: 300,
        ),
        Image.network(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuaPSc14osicwF9zIp0yI0TJYvriTvyGcoHvQEM2l493sGT1tNGrYBGYBnq6fXqVMauk8&usqp=CAU",
          width: 500,
          height: 100,
        ),
        const SizedBox(
          height: 0,
        ),
        const Text(
          "Welcome to the Quiz App",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const Text("By Pavarisa Boonyaritchaikit 643040234-1",
            style: TextStyle(fontSize: 20, color: Colors.pinkAccent)),
        const SizedBox(
          height: 200,
        ),
        SizedBox(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/quiz_ex');
            },
            child: const Text("Start"),
          ),
        ),
      ]),
    );
  }
}

class QuestionWithChoice extends StatefulWidget {
  final String title;
  final String appName = "Quiz App by 643040234-1";
  final String imagePath;
  final int currentIndex;

  const QuestionWithChoice({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.currentIndex,
  }) : super(key: key);

  @override
  QuestionWithChoiceState createState() => QuestionWithChoiceState();
}

class QuestionWithChoiceState extends State<QuestionWithChoice> {
  late int currentIndex;

  var quizInfo = {
    1: {
      "questionNo": "Question 1",
      "title": "What is this animal called?",
      "imagePath":
          "https://images.squarespace-cdn.com/content/v1/53edc2b0e4b0472dbe760c43/1573655046592-OZDEHIVTDO6WFNMO9P15/manta+anatomy+Blue+Corner+Conservation",
      "choices": [
        {
          "name": "Whale Shark",
          "isCorrect": false,
          "color": const Color.fromARGB(255, 183, 138, 191)
        },
        {
          "name": "Manta Ray",
          "isCorrect": true,
          "color": const Color.fromARGB(255, 177, 182, 233)
        },
        {
          "name": "Box Jellyfish",
          "isCorrect": false,
          "color": const Color.fromARGB(255, 215, 148, 171)
        },
        {
          "name": "Puffer Fish",
          "isCorrect": false,
          "color": const Color.fromARGB(255, 231, 212, 170)
        }
      ]
    },
    2: {
      "questionNo": "Question 2",
      "title": "What is this animal called?",
      "imagePath":
          "https://www.dnr.sc.gov/marine/pub/seascience/images/horseshoecrab1.jpg",
      "choices": [
        {
          "name": "Horshoe Crab",
          "isCorrect": true,
          "color": const Color.fromARGB(255, 183, 138, 191)
        },
        {
          "name": "Lobster",
          "isCorrect": false,
          "color": const Color.fromARGB(255, 231, 212, 170)
        },
        {
          "name": "Blue Cra",
          "isCorrect": false,
          "color": const Color.fromARGB(255, 177, 182, 233)
        },
        {
          "name": "Clam",
          "isCorrect": false,
          "color": const Color.fromARGB(255, 215, 148, 171)
        }
      ]
    },
    3: {
      "questionNo": "Question 3",
      "title": "What is this animal called?",
      "imagePath":
          "https://i.pinimg.com/736x/a3/05/13/a305137f511090e593a09694d11edac0.jpg",
      "choices": [
        {
          "name": "Seahorse",
          "isCorrect": false,
          "color": const Color.fromARGB(255, 231, 212, 170)
        },
        {
          "name": "Sea Urchin",
          "isCorrect": false,
          "color": const Color.fromARGB(255, 177, 182, 233)
        },
        {
          "name": "Shrimp",
          "isCorrect": false,
          "color": const Color.fromARGB(255, 215, 148, 171)
        },
        {
          "name": "Star Fish",
          "isCorrect": true,
          "color": const Color.fromARGB(255, 183, 138, 191)
        }
      ]
    },
  };
  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

  void showNextQuestion() {
    setState(() {
      if (currentIndex < quizInfo.length) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return QuestionWithChoice(
            title: quizInfo[currentIndex]!["title"] as String,
            imagePath: quizInfo[currentIndex]!["imagePath"] as String,
            currentIndex: currentIndex + 1,
          );
        }));
      } else {
        Navigator.pushNamed(context, '/restart');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: widget.appName,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            widget.appName,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(6),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(35),
                  child: Text(
                    quizInfo[currentIndex]?["questionNo"] as String,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.pinkAccent,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(35),
                  child: Text(
                    quizInfo[currentIndex]!["title"] as String,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 0, right: 0),
                  child: Image.network(
                    quizInfo[currentIndex]!["imagePath"] as String,
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Expanded(
                child: GridView(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 4,
                  ),
                  children: (quizInfo[currentIndex]!["choices"]
                          as List<Map<String, dynamic>>)
                      .map((choice) => ClipRRect(
                            borderRadius: BorderRadius.circular(
                                10), // Adjust the border radius as needed
                            child: QuestionChoice(
                              name: choice["name"],
                              bgColor: choice["color"],
                              isCorrect: choice["isCorrect"],
                              showNextQuestion: showNextQuestion,
                            ),
                          ))
                      .toList(),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Visibility(
                          maintainSize: true,
                          maintainAnimation: true,
                          maintainState: true,
                          visible: currentIndex > 1,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                Navigator.pop(context);
                              });
                            },
                            child: const Text("Previous"),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Visibility(
                          maintainSize: true,
                          maintainAnimation: true,
                          maintainState: true,
                          visible: true,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/home');
                              },
                              child: const Text("Home")),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Visibility(
                          maintainSize: true,
                          maintainAnimation: true,
                          maintainState: true,
                          visible: true,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (currentIndex < quizInfo.length) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              QuestionWithChoice(
                                                title: quizInfo[currentIndex]![
                                                    "title"] as String,
                                                imagePath:
                                                    quizInfo[currentIndex]![
                                                        "imagePath"] as String,
                                                currentIndex: currentIndex + 1,
                                              )));
                                } else {
                                  Navigator.pushNamed(context, '/restart');
                                }
                              });
                            },
                            child: const Text("Next"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionChoice extends StatefulWidget {
  final String name;
  final Color bgColor;
  final Color fgColor;
  final bool isCorrect;
  final Function showNextQuestion;

  const QuestionChoice({
    Key? key,
    required this.name,
    required this.bgColor,
    this.fgColor = Colors.black,
    this.isCorrect = false,
    required this.showNextQuestion,
  }) : super(key: key);

  @override
  QuestionChoiceState createState() => QuestionChoiceState();

  void updateIndex(int currentIndex) {}
}

class QuestionChoiceState extends State<QuestionChoice> {
  late Color setColor;

  @override
  void initState() {
    super.initState();
    setColor = widget.bgColor;
  }

  void checkIsCorrect() {
    final counter = Provider.of<CountScore>(context, listen: false);
    setState(() {
      if (widget.isCorrect) {
        setColor = Colors.green;
        counter.increaseScore();
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Score!'),
                content: const Text('Congrats, you get 1 points'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        widget.showNextQuestion();
                      },
                      child: const Text('Ok'))
                ],
              );
            });
      } else {
        setColor = Colors.red;
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Score!'),
                content: const Text('Sorry, you miss it!'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        widget.showNextQuestion();
                      },
                      child: const Text('Ok'))
                ],
              );
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => checkIsCorrect(),
      child: screenW <= 600
          ? Container(
              width: 170,
              height: 50,
              padding: const EdgeInsets.all(0),
              alignment: Alignment.center,
              color: setColor,
              child: Text(
                widget.name,
                style: TextStyle(color: widget.fgColor, fontSize: 14),
              ),
            )
          : Container(
              width: 250,
              height: 50,
              padding: const EdgeInsets.all(0),
              alignment: Alignment.center,
              color: setColor,
              child: Text(
                widget.name,
                style: TextStyle(color: widget.fgColor, fontSize: 14),
              ),
            ),
    );
  }
}

class RestartQuiz extends StatelessWidget {
  const RestartQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CountScore>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your total score is ${counter.score}",
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                counter.resetScore();
                Navigator.pushNamed(context, '/home');
              },
              child: const Text("Restart"),
            ),
          ],
        ),
      ),
    );
  }
}

class CountScore with ChangeNotifier {
  int score = 0;

  void increaseScore() {
    score++;
    notifyListeners();
  }

  void resetScore() {
    score = 0;
    notifyListeners();
  }
}
