import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyObject {
  int value;
  MyObject({
    required this.value,
  });
  // Phương thức tăng giá trị
  void increase() {
  value++;
  }
  // Phương thức giảm giá trị
  void decrease() {
  value--;
  }
  // Phương thức trả về giá trị
  int get myValue => value;

  // Phương thức đặt giá trị
  set myValue (int newValue) {
    value = newValue;
  }
}

class MyApp extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const MyApp({Key? key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ignore: prefer_final_fields
  MyObject _myObject = MyObject(value: 0);
  String? title;
  
  final buttonStyle = TextButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 175, 252, 207), // Màu nền
    side: const BorderSide(color: Color.fromARGB(255, 0, 0, 0)), // Viền
  ); // Style nút

  Widget _buildText() {
    return Text(
      'Giá trị: ${_myObject.myValue}',
      style: const TextStyle(fontSize: 20),
    );
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 18, color: Color.fromARGB(255, 250, 150, 100)); // Style chữ
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.person),
          title: Text(title ?? 'Debugging App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildText(),
              Wrap(
                spacing: 8.0, // Khoảng cách giữa các nút bấm
                runSpacing: 8.0, // Khoảng cách giữa các dòng
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _myObject.decrease();
                      });
                    },
                    style: buttonStyle,
                    child: const Text(
                      'Giảm',
                      style: textStyle,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _myObject.increase();
                      });
                    },
                    style: buttonStyle,
                    child: const Text(
                      'Tăng',
                      style: textStyle,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _myObject.myValue = 18;
                      });
                    },
                    style: buttonStyle,
                    child: const Text(
                      'Bằng 18',
                      style: textStyle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}