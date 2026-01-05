import 'package:flutter/material.dart';
// นำเข้าแพ็กเกจ material ของ Flutter

// หน้าแอปคำนวณเส้นรอบรูปขนมเปียกปูน
class KhanomPiakPoonPage extends StatefulWidget {
  const KhanomPiakPoonPage({super.key});

  @override
  State<KhanomPiakPoonPage> createState() => _KhanomPiakPoonPageState();
}

class _KhanomPiakPoonPageState extends State<KhanomPiakPoonPage> {

  int _diagonal = 0;    // ค่าเส้นทแยง
  int _perimeter = 0;  // ค่าเส้นรอบรูป

  final TextEditingController _diagonalCtrl = TextEditingController();

  final InputDecoration _textFieldStyle = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
    ),
  );

  // ฟังก์ชันคำนวณเส้นรอบรูป
  void _calPerimeter() {
    _diagonal = int.tryParse(_diagonalCtrl.text) ?? 0;

    setState(() {
      // สูตร: เส้นรอบรูปขนมเปียกปูน = 4 × เส้นทแยง
      _perimeter = 4 * _diagonal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("เส้นรอบรูปขนมเปียกปูน"), // ✅ เปลี่ยนชื่อหน้า
        centerTitle: true,
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

                Icon(
                  Icons.bakery_dining,
                  size: 60,
                  color: Colors.green,
                ),

                SizedBox(height: 20),

                Text(
                  "เส้นทแยง = $_diagonal หน่วย",
                  style: TextStyle(fontSize: 18),
                ),

                SizedBox(height: 10),

                Text(
                  "เส้นรอบรูป = $_perimeter หน่วย",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 30),

                TextField(
                  controller: _diagonalCtrl,
                  keyboardType: TextInputType.number,
                  decoration: _textFieldStyle.copyWith(
                    labelText: "เส้นทแยงขนมเปียกปูน",
                    prefixIcon: Icon(Icons.straighten),
                  ),
                ),

                SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton.icon(
                    onPressed: _calPerimeter,
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
