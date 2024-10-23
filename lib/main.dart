import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 95, 164, 230)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Widya Sabina'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Color> colors = [
    Colors.blue,
    Colors.red,
    const Color.fromARGB(255, 243, 33, 243),
    const Color.fromARGB(255, 54, 244, 101),
  ];

  List<Color> textColors = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  void _switchColor(int index) {
    setState(() {
      Color tempColor = colors[index];
      colors[index] = textColors[index];
      textColors[index] = tempColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                _buildColoredContainer(0, 'W'),
                _buildColoredContainer(1, 'I'),
              ],
            ),
            Row(
              children: [
                _buildColoredContainer(2, 'D'),
                _buildColoredContainer(3, 'S'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColoredContainer(int index, String text) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _switchColor(index),
        child: Container(
          color: colors[index],
          height: (MediaQuery.of(context).size.width - 16) / 2,
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: textColors[index],
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
