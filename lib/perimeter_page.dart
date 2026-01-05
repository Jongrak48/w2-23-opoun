import 'package:flutter/material.dart';

class PerimeterPage extends StatefulWidget {
  const PerimeterPage({super.key});

  @override
  State<PerimeterPage> createState() => _PerimeterPageState();
}

class _PerimeterPageState extends State<PerimeterPage> {
  int _side = 0;        // ความยาวด้าน
  int _perimeter = 0;  // เส้นรอบรูป

  final TextEditingController _sideCtrl = TextEditingController();

  final InputDecoration _textFieldStyle = InputDecoration(
    filled: true,
    fillColor: Colors.blue[100],
    border: const OutlineInputBorder(),
  );

  // ฟังก์ชันคำนวณเส้นรอบรูปขนมเปียกปูน
  void _calPerimeter() {
    _side = int.tryParse(_sideCtrl.text) ?? 0;

    setState(() {
      _perimeter = 4 * _side;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("คำนวณเส้นรอบรูปขนมเปียกปูน"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              "ความยาวด้าน = $_side เมตร\nเส้นรอบรูป = $_perimeter เมตร",
              style: const TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _sideCtrl,
              keyboardType: TextInputType.number,
              decoration: _textFieldStyle.copyWith(
                label: const Text("ความยาวด้าน"),
                hint: const Text("กรอกความยาวด้าน"),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _calPerimeter,
              child: const Text("คำนวณ"),
            ),
          ],
        ),
      ),
    );
  }
}
