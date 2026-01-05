import 'package:flutter/material.dart';

class PerimeterPage extends StatefulWidget {
  const PerimeterPage({super.key});

  @override
  State<PerimeterPage> createState() => _PerimeterPageState();
}

class _PerimeterPageState extends State<PerimeterPage> {
  int _width = 0;
  int _length = 0;
  int _perimeter = 0; // เส้นรอบรูป

  final TextEditingController _widthCtrl = TextEditingController();
  final TextEditingController _lengthCtrl = TextEditingController();

  final InputDecoration _textFieldStyle = InputDecoration(
    filled: true,
    fillColor: Colors.blue[100],
    border: OutlineInputBorder(),
  );

  // ฟังก์ชันคำนวณเส้นรอบรูป
  void _calPerimeter() {
    _width = int.tryParse(_widthCtrl.text) ?? 0;
    _length = int.tryParse(_lengthCtrl.text) ?? 0;

    setState(() {
      _perimeter = 2 * (_width + _length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("คำนวณเส้นรอบรูปสี่เหลี่ยม"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              "กว้าง $_width เมตร ยาว $_length เมตร\nเส้นรอบรูป = $_perimeter เมตร",
              style: TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _widthCtrl,
              keyboardType: TextInputType.number,
              decoration: _textFieldStyle.copyWith(
                label: Text("ความกว้าง"),
                hint: Text("กรอกความกว้าง"),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _lengthCtrl,
              keyboardType: TextInputType.number,
              decoration: _textFieldStyle.copyWith(
                label: Text("ความยาว"),
                hint: Text("กรอกความยาว"),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _calPerimeter,
              child: Text("คำนวณ"),
            ),
          ],
        ),
      ),
    );
  }
}
