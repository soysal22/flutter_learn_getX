import 'package:flutter/material.dart';

class GrahpScreen extends StatefulWidget {
  const GrahpScreen({super.key});

  @override
  State<GrahpScreen> createState() => _GrahpScreenState();
}

class _GrahpScreenState extends State<GrahpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Graph"),
      ),
      body: const Center(child: Text("Grahp Screen")),
    );
  }
}
