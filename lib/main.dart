import 'package:flutter/material.dart';
import 'package:w2_23/perimeter_page.dart';
import 'rectangle_page.dart'; //เรียกให้รู้จักหน้าสอง


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        '/': (context) => MyHomePage(),
        '/rectangle_page': (context) => RectanglePage()//ไปหน้าสอง
        '/perimeter_page' : (context) => PerimeterPage()
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  //
  const MyHomePage({super.key}); //

  @override
  Widget build(BuildContext context) {
    return Scaffold( //โครงสร้างหน้าจอ

      body: Center( //จัดครงกลางสิ่งที่อยู่ใน chaild
        child: TextButton( //ปุ่มกด
          onPressed: () => Navigator.pushNamed(context, '/rectangle_page'),//นำทางไปหน้าสอง
          child: Text("คำนวณพื้นที่สี่เหลี่ยม"),
          style: TextButton.styleFrom(backgroundColor: Colors.red, // เปลี่ยนสีปุ่ม
          foregroundColor: Colors.white), //สีตัวหนังสือในปุ่ม
          child: TextButton( //ปุ่มกด
            onPressed: () => Navigator.pushNamed(context, '/rectangle_page'),//นำทางไปหน้าสอง
            child: Text("คำนวณพื้นที่สี่เหลี่ยม"),
            style: TextButton.styleFrom(backgroundColor: Colors.red, // เปลี่ยนสีปุ่ม
                foregroundColor: Colors.white), //สีตัวหนังสือในปุ่ม
        ),

      ), // ปุ่มตรงกลางจอ
    );
  }
}








