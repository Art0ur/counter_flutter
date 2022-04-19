import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });

    print('$count');
  }

  void increment() {
    setState(() {
      count++;
    });
    print('$count');
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/space.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull ? 'Lotado!' : 'Pode entrar!',
              style: const TextStyle(
                fontSize: 26,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(100),
              child: Text(
                //'$count',
                count.toString(),
                style: TextStyle(
                  fontSize: 100,
                  color: isFull ? Colors.red : Colors.white,
                ),
              ),

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isEmpty ? null : decrement,
                  style: TextButton.styleFrom(
                      backgroundColor: isEmpty ? Colors.white.withOpacity(0.2) : Colors.blue,
                      //padding: const EdgeInsets.all(10)
                      fixedSize: const Size(100, 100),
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        //side: BorderSide(color: Colors.orange,width: 4)
                          borderRadius: BorderRadius.circular(24)
                      )
                  ),
                  child: const Text(
                    'Saiu',
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ),

                const SizedBox(width: 70),

                TextButton(
                  onPressed: isFull ? null : increment,
                  style: TextButton.styleFrom(
                      backgroundColor: isFull ? Colors.white.withOpacity(0.2) : Colors.blue,
                      //padding: const EdgeInsets.all(10)
                      fixedSize: const Size(100, 100),
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        //side: BorderSide(color: Colors.orange,width: 4)
                          borderRadius: BorderRadius.circular(24)
                      )
                  ),
                  child: const Text(
                    'Entrou',
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}