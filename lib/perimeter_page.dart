import 'package:flutter/material.dart';
// นำเข้าแพ็กเกจ material ของ Flutter
// ใช้สำหรับ Widget พื้นฐาน เช่น Scaffold, AppBar, TextField, Button ฯลฯ

// สร้างหน้า PerimeterPage เป็น StatefulWidget
// เพราะหน้านี้มีการเปลี่ยนแปลงค่า (กว้าง, ยาว, เส้นรอบรูป)
class PerimeterPage extends StatefulWidget {
  const PerimeterPage({super.key});
  // constructor ของ widget

  @override
  State<PerimeterPage> createState() => _PerimeterPageState();
// สร้าง State ของหน้านี้ และผูกกับคลาส _PerimeterPageState
}

// คลาส State ใช้เก็บข้อมูลและตรรกะการทำงานของหน้า
class _PerimeterPageState extends State<PerimeterPage> {

  int _width = 0;      // ตัวแปรเก็บค่าความกว้าง
  int _length = 0;     // ตัวแปรเก็บค่าความยาว
  int _perimeter = 0; // ตัวแปรเก็บค่าเส้นรอบรูป

  // controller สำหรับดึงค่าที่ผู้ใช้พิมพ์ใน TextField ความกว้าง
  final TextEditingController _widthCtrl = TextEditingController();

  // controller สำหรับดึงค่าที่ผู้ใช้พิมพ์ใน TextField ความยาว
  final TextEditingController _lengthCtrl = TextEditingController();

  // รูปแบบตกแต่ง TextField ใช้ร่วมกันหลายช่อง
  final InputDecoration _textFieldStyle = InputDecoration(
    filled: true,                 // เติมสีพื้นหลัง
    fillColor: Colors.white,      // สีพื้นหลังเป็นสีขาว
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14), // ขอบโค้งมน
    ),
  );

  // ฟังก์ชันคำนวณเส้นรอบรูป
  void _calPerimeter() {

    // แปลงค่าจาก TextField เป็น int
    // ถ้าแปลงไม่ได้ (เช่น ช่องว่าง) จะให้ค่าเป็น 0
    _width = int.tryParse(_widthCtrl.text) ?? 0;
    _length = int.tryParse(_lengthCtrl.text) ?? 0;

    // setState ใช้บอก Flutter ว่ามีการเปลี่ยนค่า
    // เพื่อให้หน้าจอ rebuild และแสดงผลใหม่
    setState(() {
      // สูตรเส้นรอบรูปสี่เหลี่ยม = 2 × (กว้าง + ยาว)
      _perimeter = 2 * (_width + _length);
    });
  }

  @override
  Widget build(BuildContext context) {
    // build คือส่วนที่ใช้สร้างหน้าจอ UI
    return Scaffold(
      // โครงสร้างหลักของหน้า

      appBar: AppBar(
        title: Text("คำนวณเส้นรอบรูปสี่เหลี่ยม"), // ชื่อแอปด้านบน
        centerTitle: true,                         // จัดข้อความกลาง
        backgroundColor: Theme.of(context)
            .colorScheme
            .inversePrimary,                      // สีตามธีม
      ),

      body: Container(
        width: double.infinity, // กว้างเต็มหน้าจอ
        decoration: BoxDecoration(
          // กำหนดพื้นหลังแบบไล่สี
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.surface,
              Colors.indigo.shade50,
            ],
          ),
        ),

        child: SingleChildScrollView(
          // ทำให้เลื่อนได้ ป้องกันจอล้นเมื่อคีย์บอร์ดขึ้น
          padding: const EdgeInsets.all(24), // ระยะขอบรอบจอ

          child: Column(
            children: [

              // การ์ดสำหรับจัดกลุ่มเนื้อหา
              Card(
                elevation: 6, // ความเข้มของเงา
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // มุมโค้ง
                ),

                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [

                      // ไอคอนด้านบน
                      Icon(
                        Icons.linear_scale_rounded,
                        size: 60,
                        color: Colors.indigo,
                      ),

                      SizedBox(height: 20),

                      // แสดงค่ากว้างและยาว
                      Text(
                        "กว้าง $_width เมตร ยาว $_length เมตร",
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 8),

                      // แสดงผลลัพธ์เส้นรอบรูป
                      Text(
                        "เส้นรอบรูป = $_perimeter เมตร",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 30),

                      // ช่องกรอกความกว้าง
                      TextField(
                        controller: _widthCtrl,           // เชื่อม controller
                        keyboardType: TextInputType.number, // รับเฉพาะตัวเลข
                        decoration: _textFieldStyle.copyWith(
                          label: Text("ความกว้าง"),
                          hint: Text("กรอกความกว้าง"),
                          prefixIcon: Icon(Icons.width_full),
                        ),
                      ),

                      SizedBox(height: 20),

                      // ช่องกรอกความยาว
                      TextField(
                        controller: _lengthCtrl,
                        keyboardType: TextInputType.number,
                        decoration: _textFieldStyle.copyWith(
                          label: Text("ความยาว"),
                          hint: Text("กรอกความยาว"),
                          prefixIcon: Icon(Icons.height),
                        ),
                      ),

                      SizedBox(height: 30),

                      // ปุ่มคำนวณ
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton.icon(
                          onPressed: _calPerimeter, // เรียกฟังก์ชันคำนวณ
                          icon: Icon(Icons.calculate),
                          label: Text(
                            "คำนวณ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
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
