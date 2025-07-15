import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyAppRoot()); // Renamed for clarity
}

int generateRandomNumberBetweenOneAndTen() {
  final random = Random();
  int randomNumber = random.nextInt(10); // 0 to 9
  return randomNumber + 1; // 1 to 10
}

// This widget only builds the MaterialApp
class MyAppRoot extends StatelessWidget {
  const MyAppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(), // Navigate to your actual home page
    );
  }
}

// This is your actual home page content
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) { // This 'context' is now a descendant of MaterialApp
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 8, 94, 143),
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          title: Text(
            'Guess the number',
            style: TextStyle(color: Colors.white),
          ),
          leading: Icon(
            Icons.arrow_back_sharp,
            color: Colors.white,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: Icon(Icons.info, color: Colors.white),
                onPressed: () {
                  Navigator.push( // This context is definitely from within MaterialApp's descendants
                    context,
                    MaterialPageRoute(builder: (newContext) {
                      return MyCard();
                    }),
                  );
                },
              ),
            ),
          ],
        ),
        body: Center( // No Builder needed here for body navigation if MyHomePage is separate
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Guess, What is the number that I chose ?',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        int randomNumber = generateRandomNumberBetweenOneAndTen();
                        Navigator.push(
                          context, // This context is also fine now
                          MaterialPageRoute(builder: (ctx) {
                            return NewPage(guessedNumber: 1, randomNumber: randomNumber);
                          }),
                        );
                      },
                      child: Image.asset('assets/images/1.png'),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        int randomNumber = generateRandomNumberBetweenOneAndTen();
                        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                          return NewPage(guessedNumber: 2, randomNumber: randomNumber);
                        }));
                      },
                      child: Image.asset('assets/images/2.png'),
                    ),
                  ),
                ],
              ),
              // ... Other Rows for numbers 3-6
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        int randomNumber = generateRandomNumberBetweenOneAndTen();
                        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                          return NewPage(guessedNumber: 3, randomNumber: randomNumber);
                        }));
                      },
                      child: Image.asset('assets/images/3.png'),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        int randomNumber = generateRandomNumberBetweenOneAndTen();
                        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                          return NewPage(guessedNumber: 4, randomNumber: randomNumber);
                        }));
                      },
                      child: Image.asset('assets/images/4.png'),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        int randomNumber = generateRandomNumberBetweenOneAndTen();
                        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                          return NewPage(guessedNumber: 5, randomNumber: randomNumber);
                        }));
                      },
                      child: Image.asset('assets/images/5.png'),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        int randomNumber = generateRandomNumberBetweenOneAndTen();
                        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                          return NewPage(guessedNumber: 6, randomNumber: randomNumber);
                        }));
                      },
                      child: Image.asset('assets/images/6.png'),
                    ),
                  ),
                ],
              ),
              Row( // 7 - 8
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        int randomNumber = generateRandomNumberBetweenOneAndTen();
                        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                          return NewPage(guessedNumber: 7, randomNumber: randomNumber);
                        }));
                      },
                      child: Image.asset('assets/images/7.png'),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        int randomNumber = generateRandomNumberBetweenOneAndTen();
                        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                          return NewPage(guessedNumber: 8, randomNumber: randomNumber);
                        }));
                      },
                      child: Image.asset('assets/images/8.png'),
                    ),
                  ),
                ],
              ),
              Row( // 9 -10
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        int randomNumber = generateRandomNumberBetweenOneAndTen();
                        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                          return NewPage(guessedNumber: 9, randomNumber: randomNumber);
                        }));
                      },
                      child: Image.asset('assets/images/9.png'),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        int randomNumber = generateRandomNumberBetweenOneAndTen();
                        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                          return NewPage(guessedNumber: 10, randomNumber: randomNumber);
                        }));
                      },
                      child: Image.asset('assets/images/10.png'),
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

// NewPage and MyCard classes remain the same as in your provided code
// Ensure they are defined correctly.

class NewPage extends StatelessWidget {
  final int guessedNumber;
  final int randomNumber;

  const NewPage({super.key, required this.guessedNumber, required this.randomNumber});

  @override
  Widget build(BuildContext context) {
    bool isCorrect = guessedNumber == randomNumber;
    return SafeArea(child:
    Scaffold(
      backgroundColor: Color.fromARGB(255, 8, 94, 143),
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Result', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You guessed: $guessedNumber',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            Text('The number was: $randomNumber',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                isCorrect ? 'Congratulations! You guessed it right!' : 'Oops! Try again.',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: isCorrect ? Colors.green : Colors.red),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    )
    );
  }
}

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 8, 94, 143),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 8, 94, 143),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/images/myphoto.jpg'),
              ),
              SizedBox(height: 15,),
              Text('محمد سالم الوصابي', style: TextStyle(fontSize: 25, color: Colors.white, fontFamily: 'Cairo'),),
              SizedBox(height: 5,),
              Text('مطور برمجيات', style: TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'Cairo', fontWeight: FontWeight.bold),),
              SizedBox(
                height: 30,
                width: 300,
                child: Divider(color: Colors.white70),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: ListTile(
                  leading: Icon(Icons.phone, color: Color.fromARGB(255, 8, 94, 143),),
                  title: Text('+92 319 6199683', style: TextStyle(color: Color.fromARGB(255, 8, 94, 143), fontSize: 15),),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: ListTile(
                    leading: Icon(Icons.email, color: Color.fromARGB(255, 8, 94, 143),),
                    title: Text('m.salem.alwosabi@gmail.com', style: TextStyle(color: Color.fromARGB(255, 8, 94, 143), fontSize: 15),)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
