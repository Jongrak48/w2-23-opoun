import 'package:flutter/material.dart';
import 'package:w2_23/perimeter_page.dart';
import 'package:w2_23/rectangle_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Geometry Calculator',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
      ),
      initialRoute: '/',
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
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Geometry Tool",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: theme.colorScheme.inversePrimary,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              theme.colorScheme.surface,
              Colors.indigo.shade50,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.indigo.shade100,
                ),
                child: const Icon(
                  Icons.calculate_rounded,
                  size: 60,
                  color: Colors.indigo,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "กรุณาเลือกรายการคำนวณ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 40),

              _buildMenuButton(
                context,
                title: "คำนวณพื้นที่สี่เหลี่ยม",
                icon: Icons.crop_square_rounded,
                color: Colors.redAccent,
                route: '/rectangle_page',
              ),
              const SizedBox(height: 20),
              _buildMenuButton(
                context,
                title: "คำนวณเส้นรอบรูป",
                icon: Icons.linear_scale_rounded,
                color: Colors.blueAccent,
                route: '/perimeter_page',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(
      BuildContext context, {
        required String title,
        required IconData icon,
        required Color color,
        required String route,
      }) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: ElevatedButton.icon(
        onPressed: () => Navigator.pushNamed(context, route),
        icon: Icon(icon, size: 28),
        label: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          elevation: 6,
          shadowColor: color.withOpacity(0.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
