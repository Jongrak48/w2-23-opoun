

import 'package:flutter/material.dart';

class RectanglePage extends StatefulWidget {
  const RectanglePage({super.key}); // พท.สี่เหลี่ยม = กว้าง * ย

  @override
  State<RectanglePage> createState() => RectanglePageState(); // คลาสแม่
} //มีการคำนวณ มีการเปลี่ยนค่า

class RectanglePageState extends State<RectanglePage> {
  // คลาสลูก

  int _width = 0; //ใส่_เพื่อให้เป็นไพรเวท ใช้เฉพาะในคลาส
  int _length = 0;
  int _area = 0;

  TextEditingController _widthCtrl =
      TextEditingController(); //เพิื่อควบคุมเอาไว้ดึงค่าจากช่อง อินพุท
  TextEditingController _lengthCtrl = TextEditingController();

  //แม่แบบในการใข้งานซ้้ำ
  final InputDecoration _textFiedStyle = InputDecoration(
    //คลาส
    filled: true, //พารามิตเตอร์
    fillColor: Colors.blue[100],

    border: OutlineInputBorder(),
  );

  void _calRectangle(){  //ฟังชั่นไม่คืนค่า //ฟังชั่นคำนวณ
    _width = int.tryParse(_widthCtrl.text) ?? 0 ; // พยายามดึงค่่า
    _length = int.tryParse(_lengthCtrl.text) ?? 0 ;

    setState(() {
      _area = _width * _length ; // ดัึงค่ามาคำนวณ
    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("คำนวณพื้นที่สี่เหลี่ยม"), centerTitle: true),
      body: Column(
        children: [
          SizedBox(height: 30),
          Text(
            "กว้าง $_width เมตร พื้นที่คือ $_area ตารางเมตร",
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _widthCtrl, // เรียกใช้งาน คอนโทรเลอร์
            decoration: _textFiedStyle.copyWith(
              //เรียกใช้งานคลาส
              label: Text("ความกว้าง"),
              hint: Text("กรอกความกว้าง"),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _lengthCtrl,
            decoration: _textFiedStyle.copyWith(
              label: Text("ความยาว"),
              hint: Text("กรอกความยาว"),
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(onPressed: () => _calRectangle(), child: Text("คำนวณ")),
        ],
      ),
    ); //ให้อยู่ตรงกลาง
  }
}
