import 'package:flutter/material.dart';
import 'package:w2_23/perimeter_page.dart';
import 'rectangle_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        '/': (context) => const MyHomePage(),
        '/rectangle_page': (context) => const RectanglePage(),
        '/perimeter_page': (context) => const PerimeterPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () =>
                  Navigator.pushNamed(context, '/rectangle_page'),
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text("คำนวณพื้นที่สี่เหลี่ยม"),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () =>
                  Navigator.pushNamed(context, '/perimeter_page'),
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: const Text("คำนวณเส้นรอบรูป"),
            ),
          ],
        ),
      ),
    );
  }
}
