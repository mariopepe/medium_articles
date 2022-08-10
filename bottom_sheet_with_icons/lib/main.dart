import 'package:bottom_sheet_with_icons/custom_modal_sheet.dart';
import 'package:bottom_sheet_with_icons/floating_modal.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: const Center(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black54,
        onPressed: () => showFloatingModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return const CustomModalSheet();
          },
        ),
        tooltip: 'Open',
        child: const Icon(Icons.open_in_browser_rounded),
      ),
    );
  }
}
