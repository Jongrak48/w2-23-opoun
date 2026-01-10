import 'package:flutter/material.dart';
// นำเข้าแพ็กเกจ material ของ Flutter
// ใช้สำหรับ Widget พื้นฐาน เช่น Scaffold, AppBar, TextField, Button ฯลฯ

// ==============================
// หน้าแอปคำนวณเส้นรอบรูปขนมเปียกปูน
// ==============================
class KhanomPiakPoonPage extends StatefulWidget {
  const KhanomPiakPoonPage({super.key});

  @override
  State<KhanomPiakPoonPage> createState() => _KhanomPiakPoonPageState();
// createState()
// ใช้สร้าง State ของหน้า KhanomPiakPoonPage
// เพื่อเก็บข้อมูลที่เปลี่ยนแปลงได้ เช่น ตัวเลขที่ผู้ใช้กรอก
}

// ==============================
// คลาส State สำหรับจัดการข้อมูลและหน้าจอ
// ==============================
class _KhanomPiakPoonPageState extends State<KhanomPiakPoonPage> {

  int _diagonal = 0;    // ตัวแปรเก็บค่าเส้นทแยงที่ผู้ใช้กรอก
  int _perimeter = 0;  // ตัวแปรเก็บค่าเส้นรอบรูปที่คำนวณได้

  // Controller สำหรับควบคุมและดึงค่าจาก TextField
  final TextEditingController _diagonalCtrl = TextEditingController();

  // รูปแบบตกแต่ง TextField
  final InputDecoration _textFieldStyle = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
    ),
  );

  // ==============================
  // ฟังก์ชันคำนวณเส้นรอบรูป
  // ==============================
  void _calPerimeter() {
    // แปลงค่าที่ผู้ใช้กรอกจาก TextField เป็น int
    // ถ้าแปลงไม่ได้ให้เป็น 0
    _diagonal = int.tryParse(_diagonalCtrl.text) ?? 0;

    // setState ใช้บอก Flutter ว่ามีข้อมูลเปลี่ยน
    // เพื่อให้หน้าจอวาดใหม่
    setState(() {
      // สูตรคำนวณเส้นรอบรูปขนมเปียกปูน
      // เส้นรอบรูป = 4 × เส้นทแยง
      _perimeter = 4 * _diagonal;
    });
  }

  // ==============================
  // ฟังก์ชัน build ใช้สร้าง UI ของหน้า
  // ==============================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // โครงสร้างหลักของหน้า
      appBar: AppBar(
        title: Text("เส้นรอบรูปขนมเปียกปูน"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                // ไอคอนตกแต่ง
                Icon(
                  Icons.bakery_dining,
                  size: 60,
                  color: Colors.green,
                ),

                SizedBox(height: 20),

                // แสดงค่าเส้นทแยงที่ผู้ใช้กรอก
                Text(
                  "เส้นทแยง = $_diagonal หน่วย",
                  style: TextStyle(fontSize: 18),
                ),

                SizedBox(height: 10),

                // แสดงผลลัพธ์เส้นรอบรูป
                Text(
                  "เส้นรอบรูป = $_perimeter หน่วย",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 30),

                // ช่องกรอกค่าเส้นทแยง
                TextField(
                  controller: _diagonalCtrl,
                  keyboardType: TextInputType.number,
                  decoration: _textFieldStyle.copyWith(
                    labelText: "เส้นทแยงขนมเปียกปูน",
                    prefixIcon: Icon(Icons.straighten),
                  ),
                ),

                SizedBox(height: 30),

                // ปุ่มกดคำนวณ
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton.icon(
                    onPressed: _calPerimeter,
                    // เมื่อกดปุ่ม จะเรียกฟังก์ชัน _calPerimeter()
                    icon: Icon(Icons.calculate),
                    label: Text("คำนวณ"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
