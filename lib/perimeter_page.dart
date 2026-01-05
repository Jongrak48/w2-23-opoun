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
    fillColor: Colors.white, // ปรับสีให้ดูสะอาดขึ้น
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14), // มุมโค้ง
    ),
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          // พื้นหลังไล่สี
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
          // ป้องกันจอล้น
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Card(
                elevation: 6, // เงา
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Icon(
                        Icons.linear_scale_rounded,
                        size: 60,
                        color: Colors.indigo,
                      ),
                      SizedBox(height: 20),
                      Text(
                        "กว้าง $_width เมตร ยาว $_length เมตร",
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8),
                      Text(
                        "เส้นรอบรูป = $_perimeter เมตร",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30),
                      TextField(
                        controller: _widthCtrl,
                        keyboardType: TextInputType.number,
                        decoration: _textFieldStyle.copyWith(
                          label: Text("ความกว้าง"),
                          hint: Text("กรอกความกว้าง"),
                          prefixIcon: Icon(Icons.width_full),
                        ),
                      ),
                      SizedBox(height: 20),
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
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton.icon(
                          onPressed: _calPerimeter,
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
